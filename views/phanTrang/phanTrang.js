// JavaScript Document

$(document).ready(function () {
//	load_data();
	pagination();

	function load_data(page) {
		$.ajax({
			url: "chuyenTrang.php",
			type: "GET",
			data: {
				page: page
			},
//			success: function (data) {
//				$("#proBD").html(data);
//			}
			alert('gg');
		});
	}

	function pagination(page) {
		$.ajax({
			url: "phanTrang.php",
			type: "GET",
			data: {
				page: page
			},
			success: function (data) {
				$("#paginationNumber").html(data);
			}
		});
	}

	var page = 1;
	var current_page = 1;

	$(document).on('click', '.page-link', function () {


		page = $(this).attr("id");

		if (page == 'nextPage') {
			load_data(parseInt(current_page + 1));
			pagination(parseInt(current_page + 1));
			current_page++;
		} else if (page == 'prevPage') {
			load_data(current_page - 1);
			pagination(current_page - 1);
			current_page--;
		} else {
			load_data(page);
			pagination(page);
			current_page = page;
		}
	});
});
