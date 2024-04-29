import json
import webbrowser
import os
import sys

def launch_customer_sites(json_path, customer_code):
    with open(json_path, "r", encoding="utf-8") as file:
        data = json.load(file)

    # 顧客名に基づいて情報を探す
    found = False
    for customer in data:
        if customer["code"] == customer_code:
            found = True
            # 関連するウェブサイトを開く
            for site in customer["sites"]:
                webbrowser.open(site)
            # 関連するフォルダを開く
            for folder in customer["folders"]:
                os.startfile(folder)
                print(folder)
            break

    if not found:
        print("指定された顧客名のデータが見つかりません。")

        import subprocess
        subprocess.call("PAUSE", shell=True)


if __name__ == "__main__":
    json_path = sys.argv[1]
    customer_code = sys.argv[2]
    launch_customer_sites(json_path, customer_code)
