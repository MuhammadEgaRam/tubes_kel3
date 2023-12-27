import re
import cv2
import pytesseract
import numpy as np

from ktm_model import KTMModel

# Set path to Tesseract OCR executable (update path sesuai dengan instalasi Anda)
pytesseract.pytesseract.tesseract_cmd = r'C:\Program Files\Tesseract-OCR\tesseract.exe'

def perform_ocr(file):
    # Read the image using OpenCV
    image = cv2.imdecode(np.fromstring(file.read(), np.uint8), cv2.IMREAD_COLOR)

    # Convert the image to grayscale
    gray_image = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)

    # Apply thresholding to the grayscale image
    _, thresholded_image = cv2.threshold(gray_image, thresh=130, maxval=255, type=cv2.THRESH_TRUNC)

    # Perform OCR using Tesseract on the thresholded image
    result = pytesseract.image_to_string(thresholded_image, lang="ind")

    return result

def main(image):
    result = perform_ocr(image)
    print("OCR Result:")
    print(result)

    # Initialize fields
    nim = ""
    nama = ""
    tempatTglLahir = ""
    prodi = ""
    alamat = ""
    kec = ""
    kab = ""

    # Extract information based on patterns in OCR result
    nim_match = re.search(r"nim : (.+)", result) or re.search(r"nim — : (.+)", result)
    if nim_match:
        nim = nim_match.group(1)

    nama_match = re.search(r"Nama - (.+)", result) or re.search(r"Nama : (.+)", result)
    if nama_match:
        nama = nama_match.group(1)

    ttl_match = re.search(r"TemparTgiLahir - (.+)", result) or re.search(r"TempatTgi Lahir (.+)", result)
    if ttl_match:
        tempatTglLahir = ttl_match.group(1).strip()

    prodi_match = re.search(r"Prodi - (.+)", result) or re.search(r"Prodi : (.+)", result)
    if prodi_match:
        prodi = prodi_match.group(1).strip()
        
    alamat_match = re.search(r"Alamat - (.+)", result) or re.search(r"Alamat : (.+)", result)
    if alamat_match:
        alamat = alamat_match.group(1).strip()
    
    kec_match = re.search(r"Kecamatan - (.+)", result) or re.search(r"Kecamatan : (.+)", result)
    if kec_match:
        kec = kec_match.group(1).strip()
        
    kab_match = re.search(r"Kabupaten - (.+)", result) or re.search(r"Kabupaten : (.+)", result)
    if kab_match:
        kab = kab_match.group(1).strip()

    return KTMModel(nim, nama, tempatTglLahir, prodi, alamat, kec, kab)