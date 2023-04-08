
const setPositions = () => {
    document.querySelectorAll('.col').forEach(i => {
        return this.setAttribute('data-pos', i + 1);
    })
}

const ready = () => {
    setPositions();
    const sortee = document.querySelector('.sortable');
    sortable(sortee);
    
}

$(function () {
    ready();
});

