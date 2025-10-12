import gzip

# 1️⃣ 原始文字
text = "c,n,apple,type of food,蘋果/餅購,apple synonyms,apple antonyms,apple extensions,an apple,I am eating an apple/Apple everyday, doctor keeps away"

# 2️⃣ 壓縮並存成檔案
with gzip.open("test/mm.gz", "wb") as f:
    f.write(text.encode("utf-8"))  # encode 為 bytes

print("壓縮存檔完成: mm.gz")

# 3️⃣ 從檔案讀取並解壓縮
with gzip.open("test/mm.gz", "rb") as f:
    decompressed_bytes = f.read()

# 4️⃣ decode 還原成文字
decompressed_text = decompressed_bytes.decode("utf-8")

print("解壓縮還原內容:")
print(decompressed_text)

# 5️⃣ 比較大小
original_size = len(text.encode("utf-8"))
compressed_size = len(decompressed_bytes)  # 注意：這是解壓後大小
import os
compressed_file_size = os.path.getsize("test/mm.gz")

print(f"原始大小: {original_size} bytes")
print(f"壓縮後檔案大小: {compressed_file_size} bytes")
