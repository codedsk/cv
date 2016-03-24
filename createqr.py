import argparse
import pyqrcode

command_parser = argparse.ArgumentParser()
command_parser.add_argument(
    '--size',
    help='size of the qr code',
    action="store",
    dest="size",
    default=3,
    type=int)
command_parser.add_argument(
    '--outfile',
    help='name of the file to store the qr code in',
    action="store",
    dest="outfile",
    default="qrcode.svg",
    type=str)
command_parser.add_argument(
    '--infile',
    help='treat the url input as the name of the file to read qrcode contents from',
    action="store_true",
    dest="isfile",
    default=False)
command_parser.add_argument(
    'url',
    help='url to encode in the qr code',
    action="store")
cl_options = command_parser.parse_args()

if cl_options.isfile is True:
    with open(cl_options.url,'r') as f:
        data = f.read()
else:
    data = cl_options.url

url = pyqrcode.create(data).svg(cl_options.outfile,scale=cl_options.size)
