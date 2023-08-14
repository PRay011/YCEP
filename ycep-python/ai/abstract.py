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


def get_prompt_abstract(theme):
    url = f"https://aip.baidubce.com/rest/2.0/wenxinworkshop/api/v1/template/info?&id=2566&theme={theme}&access_token={get_access_token()}"

    payload = json.dumps("")
    headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json'
    }

    response = requests.request("GET", url, headers=headers, data=payload).text

    # 截取prompt
    start_str = '"content":"'
    start_idx = response.index(start_str) + len(start_str)
    end_idx = response[start_idx:].index('","')
    response = response[start_idx:start_idx + end_idx]

    return response


def send_abstract(prompt, article):
    url = f"https://aip.baidubce.com/rpc/2.0/ai_custom/v1/wenxinworkshop/chat/eb-instant?access_token={get_access_token()}"
    messages = [
        {
            "role": "user",
            "content": prompt + article
        }
    ]
    payload = json.dumps({
        "messages": messages,
        "temperature": 0.80
    })
    headers = {
        'Content-Type': 'application/json'
    }
    response = requests.request("POST", url, headers=headers, data=payload)
    response = response.text

    # 截取result
    start_str = '"result":"'
    start_idx = response.index(start_str) + len(start_str)
    end_idx = response[start_idx:].index('","')
    response = response[start_idx:start_idx + end_idx]
    return response
