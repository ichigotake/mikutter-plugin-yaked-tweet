# -*- coding: utf-8 -*-

Plugin.create(:yaked_tweet) do

    suffix = [
        'はい、論破', 'それと便座カバー', '※18禁', 'でも長友が右から上がってきてる', '国家も同じだ',
        '※ただしイケメンに限る', '・・・・・・・・ばか', '…ﾆﾔﾘ', 'スイーツ(笑)', '私は死んだ',
        '(笑)', 'っ…ぁ…', '(爆)', '(ﾉヮ〃*)', '(ﾉヮ=*)',
        '（ ＾ω＾）',  'どうせ死ぬけど', '遊びじゃないんだよおおおおおお', 'キラっ☆', '・・・///',
        'ｷﾞｬｰｰｰwwwwwww', 'ｳﾞｪｰｰｲwwwwwww', 'ワロタ', 'HAHAHAHAHAHA',
    ]

    filter_update do |service, msgs|
        msgs.each{|m|
            m['message'] += "\n\n" + suffix[rand(suffix.length)]
        }
        [service, msgs]
    end

end
