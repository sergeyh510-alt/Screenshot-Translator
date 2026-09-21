from PIL import Image, ImageDraw

size = 256
img = Image.new("RGBA", (size, size), (30, 41, 59, 255))
d = ImageDraw.Draw(img)
d.rounded_rectangle((18, 18, 238, 238), radius=42, fill=(37, 99, 235, 255))
d.rounded_rectangle((45, 48, 211, 184), radius=18, fill=(248, 250, 252, 255))
d.rectangle((66, 82, 190, 96), fill=(37, 99, 235, 255))
d.rectangle((66, 110, 174, 124), fill=(96, 165, 250, 255))
d.rectangle((66, 138, 154, 152), fill=(96, 165, 250, 255))
d.polygon([(175, 151), (199, 212), (185, 207), (176, 228), (164, 223), (174, 202), (160, 198)], fill=(250, 204, 21, 255))
img.save("/home/ubuntu/screenshot_translator/screenshot_translator.ico", sizes=[(16,16),(32,32),(48,48),(64,64),(128,128),(256,256)])
img.save("/home/ubuntu/screenshot_translator/screenshot_translator.png")
