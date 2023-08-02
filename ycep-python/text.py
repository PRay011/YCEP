import json

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


def main():
    url = "https://aip.baidubce.com/rpc/2.0/ai_custom/v1/wenxinworkshop/chat/eb-instant?access_token=" + str(get_access_token())
    messages = []
    while True:
        content = input("user: ")
        chat_dialog = {"role": "user",
                       "content": content}
        messages.append(chat_dialog)
        payload = json.dumps({
            "messages": messages
        })
        headers = {
            'Content-Type': 'application/json'
        }
        response = requests.request("POST", url, headers=headers, data=payload)
        response = response.text
        start_str = '"result":"'
        start_idx = response.index(start_str) + len(start_str)
        end_idx = response[start_idx:].index('"')
        response = response[start_idx: start_idx + end_idx]
        print("AI:" + response)
        chat_dialog = {"role": "assistant", "content": response}
        messages.append(chat_dialog)


if __name__ == '__main__':
    main()
