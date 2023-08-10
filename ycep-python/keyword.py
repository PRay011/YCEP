import requests
import json

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

# 如果论文和摘要未完成，关键词部分最好ban掉
def get_summary():
    # 本意是读摘要然后生成关键词更轻松，如果体验不好，则换成读论文也可以
    summary_content = ("随着社会的发展，中国人口结构不断向老龄化趋势发展。老年人经常有耳朵不好的症状，因此聋人越来越多。在家中聋人经常听不到被人的呼喊，因此本设备提出了一种聋人提醒手环项目。"
                       "本项目通过佩戴一个手环在手腕上，当有人需要呼叫聋人时。只需要用手机连接手环。然后按动呼叫按钮，聋人手环就会进行振动。手环具有声音提示功能，"
                       "当有人大声呼喊时候，手环会振动提示。表示有人呼叫。同时可以发光进行提示。该手环还拥有闹钟提示功能，通过振动提示。同时可以具备手表功能，手表可以进行闹钟，"
                       "一旦到了时间可以通过振动进行提示。可以设置闹钟的时间，有效的提醒聋人")
    return summary_content


def get_prompt():
    # 摘要的prompt
    summary = get_summary()
    url = f"https://aip.baidubce.com/rest/2.0/wenxinworkshop/api/v1/template/info?id=2496&summary=" + summary + "&access_token=" + get_access_token()

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
