import requests
import json
import docx

def cut_response(response):
    start_str = '"result":"'
    start_idx = response.index(start_str) + len(start_str)
    end_idx = response[start_idx:].index('"is_truncated"')
    response = response[start_idx:start_idx + end_idx - 2]
    return response

def get_access_token():
    """
    使用 API Key，Secret Key 获取access_token，替换下列示例中的应用API Key、应用Secret Key
    """

    url = "https://aip.baidubce.com/oauth/2.0/token?grant_type=client_credentials&client_id=RokDvGoFYK2fyzcPv1DGjaDQ&client_secret=VICRduW9W87mwamM0uNPe9MbgMybg6On"

    payload = json.dumps("")
    headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json'
    }

    response = requests.request("POST", url, headers=headers, data=payload)
    return response.json().get("access_token")

#仅用作读取本地论文测试，实际请读取用户在输入框中自行输入的内容，并分章整理，带上章标题扔给ai
def read_word_document(file_path):
    doc = docx.Document(file_path)
    full_text = []
    for para in doc.paragraphs:
        full_text.append(para.text)
    content = ' '.join(full_text).replace('\n', '')
    return content

#如果论文未完成，摘要和关键词部分应该ban掉
def get_content():
    file_path = "废旧电池电能回收研究报告.docx"
    file_content = read_word_document(file_path)
    if file_content:
        return file_content
    else:
        print("无法读取Word文档内容。")

def get_prompt():
    # 摘要的prompt
    theme = input("theme:")
    article = get_content()
    url = f"https://aip.baidubce.com/rest/2.0/wenxinworkshop/api/v1/template/info?&id=2566&theme=" + theme + "&article=" + article + "&access_token=" + get_access_token()


    payload = json.dumps("")
    headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json'
    }

    response = requests.request("GET", url, headers=headers, data=payload).text

    # 截取prompt，把发过去prompt的变量
    start_str = '"content":"'
    start_idx = response.index(start_str) + len(start_str)
    end_idx = response[start_idx:].index('"templateVariables"')
    response = response[start_idx:start_idx + end_idx - 2]

    return response


def main():
    url = "https://aip.baidubce.com/rpc/2.0/ai_custom/v1/wenxinworkshop/chat/eb-instant?access_token=" + get_access_token()

    prompt = get_prompt()

    messages = [{"role": "user",
                "content": prompt}]

    while True:
        payload = json.dumps({
            "messages": messages,
            "temperature": 0.9
        })
        headers = {
            'Content-Type': 'application/json'
        }

        response = requests.request("POST", url, headers=headers, data=payload)

        response = response.text  # str

        # 截取result
        response = cut_response(response)
        print("AI: " + response)

        chat_ai = {"role": "assistant",
                   "content": response}
        messages.append(chat_ai)

        content = input("user: ")
        chat_user = {"role": "user",
                     "content": content}
        messages.append(chat_user)

        #结束标志
        if content == "end":
            sys.exit(0)


if __name__ == '__main__':
    main()
