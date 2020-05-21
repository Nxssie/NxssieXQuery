export let dataTable = () => {
    $(document).ready(function () {
        $('#songs-table').DataTable({
            "paging": false,
            "bLengthChange": false,
            "scrollY": "35vh",
            "scrollCollapse": true,
            bFilter: false,
            bInfo: false
        });
        $('.dataTables_length').addClass('bs-select');
    });
}