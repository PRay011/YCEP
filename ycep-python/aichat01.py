import json
import sys

import requests


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


def prompt(theme, part):
    # 在模型上请求prompt模板，theme和part是可以更改的变量，这个函数返回请求到的prompt
    url = "https://aip.baidubce.com/rest/2.0/wenxinworkshop/api/v1/template/info?id=2429&" \
          "theme=" + theme + "&part=" + part + "&access_token=" + get_access_token()

    payload = json.dumps("")
    headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json'
    }

    response = requests.request("GET", url, headers=headers, data=payload).text

    # 截取prompt，把发过去prompt的变量
    start_str = '"content":"'
    start_idx = response.index(start_str) + len(start_str)
    end_idx = response[start_idx:].index('","')
    response = response[start_idx:start_idx + end_idx]

    return response


def main():
    url = "https://aip.baidubce.com/rpc/2.0/ai_custom/v1/wenxinworkshop/chat/eb-instant?access_token=" + get_access_token()

    # 测试用，用户输入文章主题和要写的章节部分
    # 应该在后端自动生成改论文的主题和正在写的章节，主题：用户自己填，章节：根据分章节的按钮响应

    theme = input("主题：")
    part = input("章节部分：")

    get_prompt = prompt(theme, part)
    # print(get_prompt)

    # message初始自带prompt
    messages = [{"role": "user",
                 "content": get_prompt}]

    while True:
        payload = json.dumps({
            "messages": messages,
            "penalty_score": 1.5,
            "temperature": 0.70
        })
        headers = {
            'Content-Type': 'application/json'
        }

        response = requests.request("POST", url, headers=headers, data=payload)
        response = response.text

        # 截取result
        start_str = '"result":"'
        start_idx = response.index(start_str) + len(start_str)
        end_idx = response[start_idx:].index('"is_truncated"')
        response = response[start_idx:start_idx + end_idx - 2]

        print("AI: " + response)  # 后端自行管理输出

        chat_ai = {"role": "assistant",
                   "content": response}
        messages.append(chat_ai)

        content = input("user: ")
        chat_user = {"role": "user",
                     "content": content}
        messages.append(chat_user)

        # 用户输入end退出程序
        if content == "end":
            sys.exit(0)


if __name__ == '__main__':
    main()
