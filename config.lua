GuTu = {}

GuTu.FR = {
    ['press'] = '按 ~r~E ~w~出售毒品',
    ['process'] = '交易进行中',
	['meth'] = '冰毒袋',
	['coke'] = '可卡因袋',
	['weed'] = '大麻袋',
	['opium'] = '鸦片袋',
	['done'] = '您出售了x',
	['for'] = ' 以$的价格',
	['no'] = '此人不感兴趣',
	['cops1'] = '您不能出售毒品 ~r~',
	['cops2'] = '~s~警察在线',
	['dist'] = '您离得太远了'
}
GuTu.EN = {
    ['press'] = 'Press ~r~E ~w~to sell drugs.',
    ['process'] = 'Deal in progress.',
	['meth'] = ' meth pouches',
	['coke'] = ' coke pouches',
	['weed'] = ' weed pouches',
	['opium'] = ' opium pouches',
	['done'] = 'You sold x',
	['for'] = ' for $',
	['no'] = 'The person is not interested!',
	['cops1'] = 'You cannot sell drugs. ~r~',
	['cops2'] = ' ~s~police online.',
	['dist'] = 'You are too far!'
}
GuTu.Text = GuTu.FR

GuTu.CokePrice = math.random (400,500)
GuTu.WeedPrice = math.random (200,300)
GuTu.MethPrice = math.random (300,400)
GuTu.OpiumPrice = math.random (100,200)

GuTu.CopsNeeds = 0
