.pragma library

var wrongFields = "";

var validators = {

    name: function validateName(name) {
        var r = /.+/;
        return r.test(name);
    },

    money: function validateMoney(name) {
        var r = /(^[1-9]{1}\d{0,9}$)|^0$/;
        return r.test(name);
    }

};
function validate(fields) {
    // { text, errorText, type}

    var isValidated = true, errorText = "";

    fields.forEach(function (field){
        if (!validators[field.type](field.text)) {
            errorText += field.errorText + "\n";
            isValidated = false;
        }
    });
    
    wrongFields = "Неверно заполнены поля: \n" + errorText;

    return isValidated;
}

