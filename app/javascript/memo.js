function memo() {
  const submit_tweet = document.getElementById("submit-btn-tweet");
  submit_tweet.addEventListener("click", (e) => {
    const formData = new FormData(document.getElementById("comment-tweet-form"));
    const XHR = new XMLHttpRequest();
    const list = document.getElementById("detail-post-id");
    const gameId = list.getAttribute("tweet-comment-id");
    console.log(gameId)
    XHR.open("POST",`/games/${gameId}/game_comments`, true);
    XHR.responseType = "json";
    console.log(1);
    XHR.send(formData);
    XHR.onload = () => {
      if (XHR.status != 200) {
        alert(`Error ${XHR.status}: ${XHR.statusText}`);
        return null;
      }
      const gamecomment = XHR.response.game_comment;
      const formText = document.getElementById("comment-text-id");
      const current_user_nickname = document.getElementById("current_user.nickname").textContent;
      console.log(current_user_nickname)
      const HTML = `
      <div class="comment-list", id="comment-list-id">
        対局希望者 : ${current_user_nickname} </br>
        コメント内容 : ${gamecomment.game_comment_text}
      </div>`;
      console.log(HTML)
      list.insertAdjacentHTML("beforebegin", HTML);
      formText.value = "";
    };
    e.preventDefault();
  });
}
window.addEventListener("load", memo);