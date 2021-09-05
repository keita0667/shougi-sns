  function gamememo() {
    document.addEventListener('click', e => {
      if (e.target.closest('#comment-btn-id')) {
    e.preventDefault();
    const formData = new FormData(document.getElementById("comment-form"));
    const XHR = new XMLHttpRequest();
    const list = document.getElementById("comment-listing");
    const gameId = gon.current_game_id;
    XHR.open("POST",`/games/${gameId}/game_comments`, true);
    XHR.responseType = "json";
    XHR.send(formData);
    XHR.onload = () => {
      if (XHR.status != 200) {
        alert(`Error ${XHR.status}: ${XHR.statusText}`);
        return null;
      }
      const gamecomment = XHR.response.game_comment;
      const formText = document.getElementById("comment-text-id");
      const current_user_nickname = document.getElementById("current_user_nickname").textContent;
      const HTML = `
      <div class="comment-list", id="comment-list-id">
      <div class="comment-user">
        対局希望者 : ${current_user_nickname} </br>
      </div>
      <div class="comment-content">
        ${gamecomment.game_comment_text}
      </div>
      </div>`;
      const inHTML = HTML.replace(/\n/g, '<br>');
      list.insertAdjacentHTML("afterend", inHTML);
      formText.value = "";
      alert("コメントを送信しました")
    };
    };
  });
}
window.addEventListener("load", gamememo);