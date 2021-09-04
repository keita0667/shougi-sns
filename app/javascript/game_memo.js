  // const game_submit = document.getElementById("comment-btn-id");
  // console.log(game_submit)
  function gamememo() {
    document.addEventListener('click', e => {
      if (e.target.closest('#comment-btn-id')) {
  // game_submit.addEventListener("click", (e) => {
    e.preventDefault();
    console.log("アイウエオ");
    const formData = new FormData(document.getElementById("comment-form"));
    const XHR = new XMLHttpRequest();
    const list = document.getElementById("comment-listing");
    console.log(list)
    const gameId = gon.current_game_id;
    console.log(gameId)
    XHR.open("POST",`/games/${gameId}/game_comments`, true);
    XHR.responseType = "json";
    console.log(formData);
    XHR.send(formData);
    console.log(2)
    XHR.onload = () => {
      if (XHR.status != 200) {
        alert(`Error ${XHR.status}: ${XHR.statusText}`);
        return null;
      }
      console.log(3)
      const gamecomment = XHR.response.game_comment;
      const formText = document.getElementById("comment-text-id");
      const current_user_nickname = document.getElementById("current_user_nickname").textContent;
      console.log(current_user_nickname)
      const HTML = `
      <div class="comment-list", id="comment-list-id">
      <div class="comment-user">
        対局希望者 : ${current_user_nickname} </br>
      </div>
      <div class="comment-content">
        ${gamecomment.game_comment_text}
      </div>
      </div>`;
      console.log(HTML)
      const inHTML = HTML.replace(/\n/g, '<br>');
      list.insertAdjacentHTML("afterend", inHTML);
      formText.value = "";
      alert("コメントを送信しました")
    };
    };
  });
}
window.addEventListener("load", gamememo);