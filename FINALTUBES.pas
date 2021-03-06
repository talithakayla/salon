program tubes;
uses crt;

        type paket = record
                nama_pkt : string;
                harga : integer;
                kuota : integer;
        end;

        type pkt = array [1..100] of paket;

        type layanan = record
                nama_layanan : string;
                arr_paket : pkt;
                jumlahpkt : integer;
        end;

        type infolayanan = array [1..100] of layanan;

        type customer = record
                nama_customer : string;
                nama_pegawai : string;
                tanggal_datang : string;
                arr_list : array [1..100] of paket;
                jumlahpkt : integer;
                total_pembayaran : integer;
        end;

        type transaksi = array [1..100] of customer;

var
    jpkt : pkt;
    jlyn : infolayanan;
    jumlahpkt : integer;
    jumlahlyn : integer;
    trans : transaksi;
    jumtrans : integer;
    i : integer;
    pil : integer;

{----------------------------------------------OPENING---------------------------------------------------------------}
procedure opening;
begin
        write('___________________________________________');
        writeln;
        write('                SALON DD                   ');
        writeln;
        write('   JL. SEKEJATI 26, KIARACONDONG, BANDUNG  ');
        writeln;
        write('"LIFE IS NOT PERFECT, BUT YOUR HAIR CAN BE"');
        writeln;
        write('___________________________________________');
        writeln;
end;
{------------------------------------------------PAKET---------------------------------------------------------------}
procedure P(var jpkt : pkt; var jumlahpkt : integer);
var
        n,x : integer;
begin
        write('Masukkan Jumlah Paket : ');
        readln(x);
        if ((x+jumlahpkt) <= 100) then
        begin
                if (jumlahpkt = 0) then
                        n := 0
                else
                        n := jumlahpkt;
                repeat
                        n := n+1;
                        write('Nama Paket Ke-',n,' : ');
                        readln(jpkt[n].nama_pkt);
                        write('Harga : ');
                        readln(jpkt[n].harga);
                        write('Kuota : ');
                        readln(jpkt[n].kuota);
                until n = (x+jumlahpkt);
                        jumlahpkt := n;
        end
        else
                writeln('Kebanyakan!');
readln;
end;
{---------------------------------------------LAYANAN----------------------------------------------------------------}
procedure L(var jlyn : infolayanan);
var
        n,x : integer;
begin
        write('Masukkan Jumlah Layanan : ');
        readln(x);
        if ((x+jumlahlyn) <= 100) then
        begin
                if (jumlahlyn = 0) then
                        n := 0
                else
                        n := jumlahlyn;
                repeat
                        n := n+1;
                        write('Nama Layanan Ke-',n,' : ');
                        readln(jlyn[n].nama_layanan);
                        jlyn[n].jumlahpkt := 0;
                        P(jlyn[n].arr_paket,jlyn[n].jumlahpkt);
                until n = (x+jumlahlyn);
                        jumlahlyn := n;
        end
        else
                writeln('Kebanyakan!');
readln;
end;
{----------------------------------------------SHOW------------------------------------------------------------------}
procedure S(jlyn : infolayanan);
var
        i,j : integer;
begin
clrscr;
        i := 0;
        while (i < jumlahlyn) do
        begin
                i := i+1;
                j := 0;
                writeln('Layanan ',i);
                writeln(jlyn[i].nama_layanan);
                writeln('Daftar Paket : ');
                while (j < jlyn[i].jumlahpkt) do
                begin
                        j := j+1;
                        writeln('Paket : ',j);
                        writeln('Nama Paket : ',jlyn[i].arr_paket[j].nama_pkt);
                        writeln('Harga Paket : ',jlyn[i].arr_paket[j].harga);
                        writeln('Kuota Paket : ',jlyn[i].arr_paket[j].kuota);
                        writeln;
                end;
        end;
readln;
end;
{-------------------------------------------------EDIT HARGA---------------------------------------------------------}
procedure EH(var jlyn : infolayanan);
var
        i : integer;
        nama : string;
        ketemu : boolean;
        namapaket : string;
        j : integer;
        ketemupaket :boolean;
        harga : integer;
begin
        ketemu := false;
        i := 0;
        write('Masukkan Nama Layanan : ');
        readln(nama);
        while (i < jumlahlyn) and (ketemu = false) do
        begin
                i := i+1;
                if (jlyn[i].nama_layanan = nama) then
                        ketemu := true;
        end;
        if (ketemu = true) then
        begin
                write('Masukkan Nama Paket : ');
                readln(namapaket);
                j := 0;
                ketemupaket := false;
                while (j < jlyn[i].jumlahpkt) and (ketemupaket = false) do
                begin
                        j := j+1;
                        if (jlyn[i].arr_paket[j].nama_pkt = namapaket) then
                                ketemupaket := true;
                end;
                if (ketemupaket = true) then
                begin
                        write('Masukkan Harga Baru : ');
                        readln(harga);
                        jlyn[i].arr_paket[j].harga := harga;
                        writeln('Edit Harga Selesai!');
                end
                else
                        writeln('Paket Tidak Ketemu!');
        end
        else
                writeln('Layanan Tidak Ketemu!');
readln;
end;
{------------------------------------------------EDIT KUOTA----------------------------------------------------------}
procedure EK(var jlyn : infolayanan);
var
        i : integer;
        nama : string;
        ketemu : boolean;
        namapaket : string;
        j : integer;
        ketemupaket :boolean;
        kuota : integer;
begin
        ketemu := false;
        i := 0;
        write('Masukkan Nama Layanan : ');
        readln(nama);
        while (i < jumlahlyn) and (ketemu = false) do
        begin
                i := i+1;
                if (jlyn[i].nama_layanan = nama) then
                        ketemu := true;
        end;
        if (ketemu = true) then
        begin
                write('Masukkan Nama Paket : ');
                readln(namapaket);
                j := 0;
                ketemupaket := false;
                while (j < jlyn[i].jumlahpkt) and (ketemupaket = false) do
                begin
                        j := j+1;
                        if (jlyn[i].arr_paket[j].nama_pkt = namapaket) then
                                ketemupaket := true;
                end;
                if (ketemupaket = true) then
                begin
                        write('Masukkan Kuota Baru : ');
                        readln(kuota);
                        jlyn[i].arr_paket[j].kuota := kuota;
                        writeln('Edit Kuota Selesai!');
                end
                else
                        writeln('Paket Tidak Ketemu!');
        end
        else
                writeln('Layanan Tidak Ketemu!');
readln;
end;
{-------------------------------------------------------SEARCH-------------------------------------------------------}
procedure SRCH(jlyn : infolayanan);
var
        i : integer;
        nama : string;
        ketemu : boolean;
        j : integer;
begin
        ketemu := false;
        i := 0;
        write('Masukkan Nama Layanan : ');
        readln(nama);
        while (i < jumlahlyn) and (ketemu = false) do
        begin
                i := i+1;
                if (jlyn[i].nama_layanan = nama) then
                        ketemu := true;
        end;
        if (ketemu = true) then
        begin
                j := 0;
                writeln('Daftar Paket : ');
                while (j < jlyn[i].jumlahpkt) do
                begin
                        j := j+1;
                        writeln('Paket : ',j);
                        writeln('Nama Paket : ',jlyn[i].arr_paket[j].nama_pkt);
                        writeln('Harga Paket : ',jlyn[i].arr_paket[j].harga);
                        writeln('Kuota Paket : ',jlyn[i].arr_paket[j].kuota);
                        writeln;
                end;
        end
        else
                writeln('Layanan Tidak Ketemu!');
readln;
end;
{---------------------------------------------------SORTING----------------------------------------------------------}
procedure sorting;
var
        i : integer;
        nama : string;
        ketemu : boolean;
        namapaket : string;
        j : integer;
        ketemupaket : boolean;
        harga : integer;
        k,v,min : integer;
        tmp : paket;
begin
        ketemu := false;
        i := 0;
        write('Masukkan Nama Layanan : ');
        readln(nama);
        while (i < jumlahlyn) and (ketemu = false) do
        begin
                i := i+1;
                if (jlyn[i].nama_layanan = nama) then
                ketemu := true;
        end;
        if (ketemu = true) then
        begin
                for k := 1 to jlyn[i].jumlahpkt - 1 do
                begin
                        min := k;
                        for v := k+1 to jlyn[i].jumlahpkt do
                                if (jlyn[i].arr_paket[v].harga < jlyn[i].arr_paket[min].harga) then
                                begin
                                        min:=v;
                                end;
                        tmp := jlyn[i].arr_paket[min];
                        jlyn[i].arr_paket[min] := jlyn[i].arr_paket[k];
                        jlyn[i].arr_paket[k] := tmp;
                end;
                writeln('Sorting Selesai!');
        end
        else
                writeln('Layanan Tidak Ketemu!');
readln;
end;
{---------------------------------------------------DELETE-----------------------------------------------------------}
procedure delete;
var
        i : integer;
        nama : string;
        ketemu : boolean;
        namapaket : string;
        j : integer;
        ketemupaket : boolean;
        harga : integer;
begin
        ketemu := false;
        i := 0;
        write('Masukkan Nama Layanan : ');
        readln(nama);
        while (i < jumlahlyn) and (ketemu = false) do
        begin
                i := i+1;
                if (jlyn[i].nama_layanan = nama) then
                ketemu := true;
        end;
        if (ketemu = true) then
        begin
                for j := 1 to jumlahlyn do
                begin
                        jlyn[j].nama_layanan := jlyn[j+1].nama_layanan;
                        jlyn[j].arr_paket := jlyn[j+1].arr_paket;
                        jlyn[j].jumlahpkt := jlyn[j+1].jumlahpkt;
                end;
                jlyn[jumlahlyn].nama_layanan := '';
                for j := 1 to jlyn[jumlahlyn].jumlahpkt do
                begin
                        jlyn[jumlahlyn].arr_paket[j].nama_pkt := '';
                        jlyn[jumlahlyn].arr_paket[j].harga := 0;
                        jlyn[jumlahlyn].arr_paket[j].kuota := 0;
                end;
                jlyn[jumlahlyn].jumlahpkt := 0;
                jumlahlyn := jumlahlyn - 1;
                writeln('Layanan Berhasil Dihapus!');
        end
        else
                writeln('Layanan Tidak Ketemu!');
readln;
end;


{--------------------------------------------------SUB MENU----------------------------------------------------------}
procedure SM;
var
        pil : integer;
begin
clrscr;
opening;
        writeln('1. Cari Layanan');
        writeln('2. Edit Harga Layanan');
        writeln('3. Edit Kuota Layanan');
        writeln('4. Show Layanan');
        writeln('5. Sorting Harga Paket');
        writeln('6. Delete Layanan');
        writeln;
        write('Pilih Menu : ');
        readln(pil);
        case pil of
                1 : begin
                        SRCH(jlyn);
                    end;

                2 : begin
                        EH(jlyn);
                    end;

                3 : begin
                        EK(jlyn);
                    end;

                4 : begin
                        S(jlyn);
                    end;

                5 : begin
                        sorting;
                    end;

                6 : begin
                        delete;
                    end;
        end;
readln;
end;
{-------------------------------------------------TRANSAKSI CUSTOMER-------------------------------------------------}
procedure TC(jlyn : infolayanan; var trans : transaksi);
var
        i,j,k,l,m : integer;
        lyn,pkt : string;
        ketemu,ketemupaket : boolean;
begin
        jumtrans := jumtrans+1;
        i := jumtrans;
        trans[i].total_pembayaran := 0;
        trans[i].jumlahpkt := 0;
        write('Masukkan Nama Customer : ');
        readln(trans[i].nama_customer);
        write('Masukkan Nama Pegawai : ');
        readln(trans[i].nama_pegawai);
        write('Maukkan Tanggal Datang : ');
        readln(trans[i].tanggal_datang);
        write('Masukkan Jumlah Paket Yang Diambil : ');
        readln(j);
        for k := 1 to j do
        begin
                write('Masukkan Nama Layanan Yang Diambil Ke-',k,' : ');
                readln(lyn);
                ketemu := false;
                l := 0;
                while (l < jumlahlyn) and (ketemu = false) do
                begin
                        l := l+1;
                        if (jlyn[l].nama_layanan = lyn) then
                                ketemu := true;
                end;
                if (ketemu = true) then
                begin
                        ketemupaket := false;
                        m := 0;
                        write('Masukkan Nama Paket Yang Diambil : ');
                        readln(pkt);
                        while (m < jlyn[l].jumlahpkt) and (ketemupaket = false) do
                        begin
                                m := m+1;
                                if (jlyn[l].arr_paket[m].nama_pkt = pkt) then
                                        ketemupaket := true;
                        end;
                        if (ketemupaket = true) then
                        begin
                                trans[i].jumlahpkt := trans[i].jumlahpkt + 1;
                                trans[i].arr_list[k] := jlyn[l].arr_paket[m];
                                trans[i].total_pembayaran := trans[i].total_pembayaran + jlyn[l].arr_paket[m].harga;
                        end
                        else
                                writeln('Paket Tidak Ada!');
                end
                else
                        writeln('Layanan Tidak Ada!');
        end;
        writeln('Total Pembayaran : ',trans[i].total_pembayaran);
        writeln;
end;
{---------------------------------------------SHOW TRANSAKSI CUSTOMER------------------------------------------------}
procedure STC(trans : transaksi);
var
        i,j : integer;
begin
clrscr;
        i := 0;
        while (i < jumtrans) do
        begin
                i := i+1;
                j := 0;
                writeln('Transaksi ',i);
                writeln('Nama Customer : ',trans[i].nama_customer);
                writeln('Nama Pegawai : ',trans[i].nama_pegawai);
                writeln('Tanggal Datang : ',trans[i].tanggal_datang);
                write('Daftar Paket Yang Diambil : ');
                while (j < trans[i].jumlahpkt) do
                begin
                        j := j+1;
                        writeln('Paket ',j);
                        writeln('Nama Paket : ',trans[i].arr_list[j].nama_pkt);
                        writeln('Harga Paket : ',trans[i].arr_list[j].harga);
                end;
                writeln('Total Pembayaran : ',trans[i].total_pembayaran);
        end;
readln;
end;
{----------------------------------------------------MAIN MENU-------------------------------------------------------}
begin
        jumlahlyn := 0;
        i := 1;
        jumtrans := 0;
        repeat
        clrscr;
        opening;
                writeln('1. Input Layanan');
                writeln('2. Info Layanan');
                writeln('3. Transaksi Customer');
                writeln('4. Show Hasil Transaksi');
                writeln('5. Exit');
                writeln;
                write('Pilih Menu : ');
                readln(pil);
                case pil of
                        1 : begin
                                L(jlyn);
                                end;

                        2 : begin
                                SM;
                                end;

                        3 : begin
                                TC(jlyn,trans);
                                end;

                        4 : begin
                                STC(trans);
                                end;
                end;
        until (pil = 5);
readln;
end.