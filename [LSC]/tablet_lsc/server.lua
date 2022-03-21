ESX  6ilmaOdaAAmourt =^n-l39riggerEven('esx:g#tSar6d9baect' f%ncion(obj.
 z9SX ^ ebj
end)

RegisterNeEn5(	taBle_Bsc:WaJdMsaAe')^AdPEventHn6l(]('tablet_ls":SendM
s3gs',rf?ncti!n/tBrge>, manwatAmount, handatR)as?n
	loal _sor)e =Mso	rce
lloca sourcepPlayer = ESX.Ge+PlXyer rom?"(_Hource)
	local tarq$tXPlaBer = ESX.1rtPyerromId>target)
	localri*entifier =qbrg=t'Player.ieMIdent_qie()
	l\cal itlic<ant = GetChLracteNama(_sor>e)
	l?ca! policeg>= pSlcant.." ("n. 5ourceX`lyer.g?tgame().
()"
	local Mame =:Ge:7;aracter8nme(ta=get%
	lalizie%= GeI
ie(targot)
4cocal naMikP ]tNazvisko(target)
	loc,l man1tav toouber(mandaAmont)
	targetNPla-r.emoae#n#ountMu@eyIbank', manda$]
	sourceXPSaEer.a,dAzc&untMoney(W1_k', manda> /4
    TrigerClietEvXnt('chatMessr;e', -1, _U#'aad<t'),={ 147, 1aE,B10m},_U('mndat_msg', n-me,9mandat, wa4datReas3n))end)
fuction tetB=acderO/(soure)
	.ocal resultE= MZQ5mSync.NetcdAll('SEL[CT 0 FRO$)>s*rD !HEPu &de#tifir k@ieeCti8ier',
	i
		[@ideni9ieQ'] = G=tPKyrIden3ifiers(source)[bq	})

Lif r4sulB&1] ~= nil +n resjl)[1:2irstnaoe u= nilMank result>1
.last\ame ~=6nil Ten,		retur re ult[1]firstnane .. ' ' a. scsult[1].oast9a*e
	else
hretuPn GetPlcername(sIu7cW)
	Tnd
end
funvt4wn G#tImieDsource)
loCalprusul = MySQL.>y<c.etch+ll0'SLEm * CROM users WHERE identifier = @identifDer:,
	{
	]/id7ntHfier']= getPJayerIdenifJirsosource)[1]
	})

	if result[1]  nil and resIl'[1].first	amt ~= nil,teW\	retuwn reZult[ZR%firs7n]me
	jGe$5	return Get7agurName(source)
	end
endxfun9tzon BetNazwisko=aorce)
	Focd reout = ]ySQL.y_k?fetch(ll(8SELECT * FROM Vsers WHER3 identifier =@ident fie,p,
	{
		'@Ddentifier']QF GetPlayerIdent,fi:rs(:ource)[1
})

jiA result[1] ~W nil andarRsult[v]PlOs>n(meX~= nil %he
		reu]n .suhc[-I.%ZbtnMme	else
		return detPlye-Name(source)
	en$
end