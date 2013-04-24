# -*- coding: utf-8 -*-
miquire :mui, 'sub_parts_helper'

require 'gtk2'
require 'cairo'

class Gdk::SubPartsYakedTweet < Gdk::SubParts
    regist

    def initialize(*args)
        super
        @suffix = [
            'それと便座カバー', '※18禁',
            '※ただしイケメンに限る', '・・・・・・・・ばか', '…ﾆﾔﾘ', 'スイーツ(笑)', '私は死んだ',
            '(笑)', 'っ…ぁ…', '(爆)', '(ﾉヮ〃*)', '(ﾉヮ=*)',
            '（ ＾ω＾）',  'どうせ死ぬけど', '遊びじゃないんだよおおおおおお', '・・・///',
            'ｷﾞｬｰｰｰwwwwwww', 'ｳﾞｪｰｰｲwwwwwww', 'ワロタ', 'HAHAHAHAHAHA',
            'ファーーーーーーーwwwwwwwwwwwwwwwww',
            '▂▅▇█▓▒░(’ω’)░▒▓█▇▅▂うわあああああ',
            'こんな時こそタウンページが便利なんですよ',
        ]

        @margin = 54 #アイコンの横幅
        if message and not helper.visible?
        sid = helper.ssc(:expose_event, helper){
            helper.on_modify
            helper.signal_handler_disconnect(sid)
            false } end
    end

    def render(context)
        if helper.visible? and message
            context.save{
            layout = main_message(context)
            context.translate(width / Pango::SCALE + @margin, 0)
            context.set_source_rgb(*(UserConfig[:mumble_basic_color] || [0,0,0]).map{ |c| c.to_f / 65536 })
            context.show_pango_layout(layout) } end end

    def height
        main_message.size[1] / Pango::SCALE end
    memoize :height

    private

    def main_message(context = dummy_context)
        layout = context.create_pango_layout
        layout.font_description = Pango::FontDescription.new(UserConfig[:mumble_basic_font])
        layout.alignment = Pango::ALIGN_LEFT
        if(message[:source])
            layout.text = @suffix[rand(@suffix.length)]
        else
            layout.text = '' end
        layout end

    def message
        helper.message end

end
