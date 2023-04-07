const ready = () => {
    const sortee = document.querySelector('.sortable');
    return sortable(sortee);
}

$(function () {
    ready();
});

