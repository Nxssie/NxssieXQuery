export let dataTable = () => {
    $(document).ready(function () {
        $('#songs-table').DataTable({
            "bLengthChange": false
        });
        $('#songs-table_wrapper').find('label').each(function () {
            $(this).parent().append($(this).children());
        });
    });
}