$(document).ready(function() {
    $('select#laboratory_course_id').select2();
    $('select#laboratory_group_id').select2();
});

function update_select_group() {
    var course_id = $("#laboratory_course_id").val();
    var groups = [];
    $.getJSON("/courses/" + course_id + "/unused_groups.json", (data) => {
        groups = data.map((group, i) => {
            return {id: group.id, name: group.name};
        });
        document.getElementById("laboratory_group_id").innerHTML = "";
        for(var i in groups) {
            document.getElementById("laboratory_group_id").innerHTML += "<option value='"+groups[i].id+"'>"+groups[i].name+"</option>"; 
        }

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
}