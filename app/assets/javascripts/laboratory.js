$(document).ready(function() {
    $('select#laboratory_course_id').select2();
    $('select#laboratory_group_id').select2();
    
    $("#laboratory_course_id").on('change', function() {
        var course_id = $("#laboratory_course_id").val();
        var groups = [];
        $.getJSON("/courses/" + course_id + "/unused_groups.json", (data) => {
            groups = data.map((group, i) => {
                return {id: group.id, name: group.name};
            });
            let input = $("#laboratory_group_id");
            console.log(groups);
            input.select2({
               data: groups,
            });

            var observer = new MutationObserver(function (mutations) {
                if (mutations[0].type === 'chilList') {
                    $("#share").prop('disabled', false);
                }
            });

            var observerConfig = {
                childList: true,
                characterData: true
            };
        });
    });
});