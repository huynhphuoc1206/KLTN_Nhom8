function showAlert(message) {
    Swal.fire({
        icon: 'error',
        title: 'Lỗi!',
        text: message,
        background: '#ecf0f1',
        confirmButtonColor: '#3085d6',
        confirmButtonText: 'OK',
        showCancelButton: false,
        timer: 5000,
        allowOutsideClick: false,
        allowEscapeKey: true,
        customClass: {
            popup: 'swal2-popup',
            title: 'swal2-title',
            content: 'swal2-content',
            confirmButton: 'swal2-confirm'
        },
        didOpen: () => {
            document.body.style.overflow = 'hidden'; // KHÓA cuộn body khi mở alert
        },
        willClose: () => {
            document.body.style.overflow = ''; // MỞ lại cuộn body khi đóng alert
        }
    });
}
