.pragma library

var wrongFields = "";

var _validators = {

    title: /.{4,100}/,
    name: /^[А-Яа-я]{4,30}$/,
    money: /^[1-9]{1}\d{0,9}$|^0$/

};

function _isValid(text, type) {
    return _validators[type].test(text);
}

function validate(fields) {
    // { text, errorText, type}

    var isValidated = true, errorText = "";

    fields.forEach(function (field){

        if (!_isValid(field.text, field.type)) {

            errorText += field.errorText + "\n";
            isValidated = false;
        }
    });
    
    wrongFields = "Неверно заполнены поля: \n" + errorText;

    return isValidated;
}

