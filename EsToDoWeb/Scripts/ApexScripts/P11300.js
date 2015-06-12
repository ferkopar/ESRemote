jQuery.fn.tagName = function () {
    return this.prop("tagName");
};

function openTree(p) {
    listItem = $(p).closest('li');
    var d = document.createElement('div');
    listItem.append(d);

    txt = document.createTextNode('This is the text in new element.');
    d.appendChild(txt);
}

