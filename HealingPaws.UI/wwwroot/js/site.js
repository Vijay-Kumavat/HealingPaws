window.showDeleteModal = () => {
    $('#deleteModal').modal('show');
};

window.hideDeleteModal = () => {
    $('#deleteModal').modal('hide');
};

function SetMinDate() {
    let dateInput = document.getElementById("date");
    dateInput.min = new Date().toISOString().slice(0, new Date().toISOString().lastIndexOf(":"));
}