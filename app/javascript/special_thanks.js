function Sthanks () {
  console.log("非同期投稿を実装")
  
    const special_submit = document.getElementById("special-thanks-button");
    special_submit.addEventListener("click", (e) => {
    // const formData = new FormData(document.getElementById("new_article"));
    const XHR = new XMLHttpRequest();
    XHR.open("POST", "comments/:comment_id/special_thanks", true);
    XHR.responseType = "json";
    XHR.send(formData);
    XHR.onload = () => {
      if (XHR.status != 200) {
        alert(`Error ${XHR.status}: ${XHR.statusText}`);
        return null;
      }
      const item = XHR.response.article;
      const formtext = document.getElementById("article_text");
      // console.log(item)
      const area = document.getElementById("contents_area");
      const HTML =`
      <div class="article">
          ${ item.text }
          </div>`;
          area.insertAdjacentHTML("afterbegin", HTML);
          formtext.value = "";
    };
    e.preventDefault();
  })
}

window.addEventListener("load", Sthanks);
