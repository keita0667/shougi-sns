function memo() {
  const submit = document.getElementById("comment-btn-id");
  submit.addEventListener("click", (e) => {
    const formData = new FormData(document.getElementById("comment-form"));
    const XHR = new XMLHttpRequest();
    XHR.open("POST", "", true);
    XHR.responseType = "json";
    console.log(1);
    XHR.send(formData);
    XHR.onload = () => {
      if (XHR.status != 200) {
        alert(`Error ${XHR.status}: ${XHR.statusText}`);
        return null;
      }
      const content = XHR.response.game_comment;
      console.log(content)
      const list = document.getElementById("comment-list-id");
      console.log(list)
      const formText = document.getElementById("comment-text-id");
      const current_user_nickname = document.getElementById("current_user.nickname").textContent;
      console.log(current_user_nickname)
      const HTML = `
      <div class="comment-list", id="comment-list-id">
        対局希望者 : ${current_user_nickname} </br>
        コメント内容 : ${content.game_comment_text}
      </div>`;
      console.log(HTML)
      list.insertAdjacentHTML("beforebegin", HTML);
      formText.value = "";
      console.log(final)
    };
    e.preventDefault();
  });
}
window.addEventListener("load", memo);