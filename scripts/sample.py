import requests

def get_random_quote():
    response = requests.get("https://api.quotable.io/random")
    if response.status_code == 200:
        quote = response.json()["content"]
        author = response.json()["author"]
        print(f"Random Quote: {quote} - {author}")
    else:
        print("Failed to fetch random quote.")

if __name__ == "__main__":
    get_random_quote()
