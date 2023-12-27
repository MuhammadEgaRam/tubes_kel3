import json

class KTMModel:
    def __init__(self, nim, nama, tempatTglLahir, prodi, alamat, kec, kab):
        self.nim = nim
        self.nama = nama
        self.tempatTglLahir = tempatTglLahir
        self.prodi = prodi
        self.alamat = alamat
        self.kec = kec
        self.kab = kab

    def toJson(self):
        return json.dumps(self.__dict__)

    @classmethod
    def fromJson(cls, json_str):
        json_dict = json.loads(json_str)
        return cls(**json_dict)