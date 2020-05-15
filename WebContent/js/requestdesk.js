function SetDataToItem(item_name, value)
{
	var item = document.getElementById(item_name);
	item.setAttribute('data-info', value);
}

function GetDataFromItem(item_name)
{
	var item = document.getElementById(item_name);
	return item.getAttribute('data-info');
}

function GetContextPath()
{
	return window.location.pathname.substring(0, window.location.pathname.indexOf("/",2));
}

function RedirectToLoginPage()
{
	window.location.replace(GetContextPath() + "/login");
}

jQuery(document).ready(function($) {
    $('*[data-href]').on('click', function() {
        window.location = $(this).data("href");
    });
});