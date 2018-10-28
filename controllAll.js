var http = require('http');
var qs = require('querystring');
var fs = require('fs');
var hbs = require('hbs');
//var bs = require('bootstrap');
var express = require('express');
var bodyParser = require('body-parser');
var route = express();
var mysql = require('mysql');
var session = require('express-session');
var cookieParser = require('cookie-parser');
var flash = require('connect-flash');
/*
	koneksi database
*/
var konek = mysql.createConnection({
	host: "localhost",
	user: "root",
	password: "",
	database: "mahasiswa",
});
konek.connect(function(err){
	if(err) throw err;
	console.log("udah konek");
});

route.use(cookieParser('secret'));
route.use(session({cookie: { maxAge: 60000 }}));
route.use(flash());
route.set('view engine', 'hbs');
route.use(bodyParser.json());
route.use(bodyParser.urlencoded({ extended: true }));
/*
	server yang digunakan
*/
route.listen(8000, () => {
	console.log('server berjalan pada port 8000');	
});


/*
	Route URL
*/
route.use('/asset', express.static(__dirname + '/node_modules/bootstrap/dist'));//buat load folder bootstrap
route.use('/ang', express.static(__dirname + '/node_modules/angular'));//buat load angular
//tampilkan data mahasiswa
route.get('/', function(req, res){
	konek.query("SELECT * FROM `mahasiswa` join prodi on prodi.id_prodi = mahasiswa.id_prodi join jurusan on jurusan.id_jurusan = prodi.id_jurusan order by id_mahasiswa asc",function(err,result)
	{
		if (err) throw err;
		//console.log(result);
		res.render('mahasiswa',{
			result:result,
		});
	});
});

route.get('/jajal', function(req,res){
	res.render("mahasiswaw");
});

route.get('/mahasiswa', function(req, res){
	konek.query("SELECT * FROM `mahasiswa` join prodi on prodi.id_prodi = mahasiswa.id_prodi join jurusan on jurusan.id_jurusan = prodi.id_jurusan order by id_mahasiswa asc",function(err,result)
	{
		if (err) throw err;
		//console.log(result);
		res.send(JSON.stringify({
			result:result,
		}));
	});
});
//tambah mahasiswa
route.get('/mahasiswa/add', function(req, res){
		res.render("formm");
});

// route.get('/jurusan', function(req,res){
// 	konek.query("SELECT * FROM `jurusan`",function(err,jurusan)
// 	{
// 		if (err) throw err;
// 		res.send(JSON.stringify({
// 			jurusan:jurusan
// 		}));
// 	});
// });

//simpan mahasiswa
route.post('/mahasiswa/add', function(req, res){
	var q = "INSERT INTO `mahasiswa` (nama, npm, id_prodi) VALUES (";
		q += " '"+req.body.nama+"', ";
		q += " '"+req.body.npm+"', ";
		q += " '"+req.body.id_prodi+"') ";

	konek.query(q, function(err, result){
		req.flash('success', 'Data baru telah masuk');
        res.locals.message = req.flash();
		res.redirect('/mahasiswa/add');
	});
});
//update data mahasiswa
route.get('/mahasiswa/update/:id_mahasiswa', function(req, res){
	konek.query("SELECT * FROM `mahasiswa` where id_mahasiswa = ? ", req.params.id_mahasiswa,function(err,result)
	{
		if (err) throw err;
		//console.log(result);
		res.render('editm',{
			result:result,
		});
	});
});
//simpan update
route.post('/mahasiswa/update/:id_mahasiswa', function(req, res){
	konek.query("UPDATE `mahasiswa` SET nama = ?, npm = ?, id_prodi = ? where id_mahasiswa = ?", [req.body.nama, req.body.npm, req.body.id_prodi, req.params.id_mahasiswa], function(err, result){
		if(err) throw err;
		req.flash('nahloh', 'Data telah berubah');
        res.locals.message = req.flash();
		res.redirect('/');
	});
});
//hapus data mahasiswa
route.get('/mahasiswa/hapus/:id_mahasiswa', function(req, res){
	konek.query("DELETE FROM `mahasiswa` where id_mahasiswa = ? ", req.params.id_mahasiswa,function(err,result)
	{
		if (err) throw err;
		req.flash('gapapa', 'Data telah dihapus');
        res.locals.message = req.flash();
		res.redirect('/');
	});
});

/*

PR
- select option jurusan dan prodi secara dinamis [gagal]
- bootstrap tampilan [udah]
- memberi pesan/pemberitahuan setelah proses tambah edit hapus

*/