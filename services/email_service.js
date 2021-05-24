var nodemailer = require('nodemailer');

var transporter = nodemailer.createTransport({
  service: 'gmail',
  auth: {
    user: 'test.email.api.sender@gmail.com',
    pass: 'P@55w0rd12'
  }
});

exports.sendMail = function(email,title,message){
    var mailOptions = {
        from: 'youremail@gmail.com',
        to: email,
        subject: title,
        text: message
      };

    transporter.sendMail(mailOptions, function(error, info){
        if (error) {
          console.log(error);
        } else {
          console.log('Email sent: ' + info.response);
        }
      });
}