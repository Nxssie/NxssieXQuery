export let insertData = () => {
    let updateForm = document.getElementById("update-form");
    console.log(document.getElementById("td-name").childNodes[0].nodeValue);
    updateForm["name"].value = document.getElementById("td-name").childNodes[0].nodeValue;
}