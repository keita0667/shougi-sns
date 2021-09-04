function memo() {
  console.log(1)
  document.addEventListener('click', e => {
    if (e.target.closest('#answer-button-id')) {
      console.log(2)
    e.preventDefault();
    const formData = new FormData(document.getElementById("tweet-form"));
    const XHR = new XMLHttpRequest();
    const list = document.getElementById("answer-list-id");
    console.log(list)
    const tweetId = gon.current_tweet_id;
    XHR.open("POST",`/tweets/${tweetId}/comments`, true);
    XHR.responseType = "json";
    console.log(1);
    XHR.send(formData);
    XHR.onload = () => {
      if (XHR.status != 200) {
        alert(`Error ${XHR.status}: ${XHR.statusText}`);
        return null;
      }
      const comment = XHR.response.comment;
      console.log(comment)
      const formText = document.getElementById("answer-memo-id");
      const current_user_nickname = document.getElementById("current_user_nickname").textContent;
      console.log(current_user_nickname)
      const HTML = `
      <p>
            <strong>回答者：${current_user_nickname}</strong>
            <div class="container">
            ${comment.text}
            </div>
          </p>`;
      console.log(HTML)
      const inHTML = HTML.replace(/\n/g, '<br>');
      list.insertAdjacentHTML("afterend", inHTML);
      formText.value = "";
    };
    alert("コメントを送信しました");
  };
  });
}
window.addEventListener("load", memo);