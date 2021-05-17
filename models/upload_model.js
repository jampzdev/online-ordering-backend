const mime  = require("mime")
const fs    = require("fs")

exports.save = async (req, res, next) => {
    var matches = req.body.base64image.match(/^data:([A-Za-z-+\/]+);base64,(.+)$/),
    response = {};

  if (matches.length !== 3) {
    return new Error('Invalid input string');
  }

  response.type = matches[1];
  response.data = Buffer.from(matches[2], 'base64');
  let decodedImg = response;
  let imageBuffer = decodedImg.data;
  let type = decodedImg.type;
  let extension = mime.getExtension(type);
  let timestamp = new Date().getTime();
  let fileName =  timestamp+"." + extension;
  let filePath = "./images/";
  try {
    fs.writeFileSync(filePath + fileName, imageBuffer, 'utf8');
    return fileName
  } catch (e) {
    console.log(e);
  }
}