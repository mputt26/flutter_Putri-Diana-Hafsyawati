# FLUTTER STATE MANAGEMENT

### DEFINISI
Data yang bisa dibaca saat pembuatan widget, dapat berubah saat widget sedang aktif, hanya dimiliki oleh stateful.
state adalah data yang dapat berubah secara dinamis.

1. Kenapa perlu global state?
   - agar antara widget dapat memanfaatkan state yang sama dengan mudah
2. manfaat state
   - dibuat sebagai properti dari class
   - digunakan pada widget saat build
### GLOBAL STATE
state biasa yang dapat digunakan pada seluruh widget

1. Provider
    - state management
    - perlu di install agar dapat digunakan
