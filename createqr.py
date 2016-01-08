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
    'url',
    help='url to encode in the qr code',
    action="store")
cl_options = command_parser.parse_args()

url = pyqrcode.create(cl_options.url).svg(cl_options.outfile,scale=cl_options.size)
