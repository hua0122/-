<?php
$name = $_FILES['file']['name'];//文件名
$dizhi = $_FILES['file']['tmp_name'];//图片临时地址，脚本结束则销毁
$houzhui = $_FILES['file']['type'];//图片类型


$str = md5(uniqid(mt_rand(), true));//生成唯一ID
$zz = base64EncodeImage($houzhui,$dizhi,$str);
echo "data:image/webp;base64,".$zz;
function base64EncodeImage($houzhui,$dizhi,$str)
{
    switch ($houzhui) {
        case 'image/png':
            $im = imagecreatefrompng($dizhi);
            break;
        case 'image/gif':
            $im = imagecreatefromgif($dizhi);
            break;
        case 'image/jpeg':
            $im = imagecreatefromjpeg($dizhi);
            break;
        case 'image/jpg':
            $im = imagecreatefromjpeg($dizhi);
            break;
        default:
            exit("上传文件格式不正确");
            break;
    }
    header("Content-type:image/webp");
    imagewebp($im,'img/'.$str.'.webp');
    imagedestroy($im);

    return base64_encode(file_get_contents('img/'.$str.'.webp'));//先将文件写入字符串，在进行base64编码
}


?>