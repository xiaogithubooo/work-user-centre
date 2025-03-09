-- ./sql/init_assumption_data.sql: 数据源模拟数据
-- 模拟数据
TRUNCATE TABLE user;
INSERT INTO user (user_account, user_wx_union, user_mp_open, user_email, user_phone, user_ident, user_passwd, user_avatar, user_tags, user_nick, user_name, user_profile, user_birthday, user_country, user_address, user_role, user_level, user_gender, deleted)
VALUES
    ('aimou', 'wx_union_aimou', 'mp_open_aimou', 'aimou@example.com', '13800138001', '370101198701012345', '47ec2dd791e31e2ef2076caf64ed9b3d', 'https://example.com/avatar_aimou1.jpg', '["tag1"]', 'aimou', '艾梦', '这是艾梦的个人简介', '1987-01-01', '中国', '北京市朝阳区', 0, 1, 1, 0),
    ('bimou', 'wx_union_bimou', 'mp_open_bimou', 'bimou@example.com', '13800138002', '370101198802022345', '47ec2dd791e31e2ef2076caf64ed9b3d', 'https://example.com/avatar_bimou2.jpg', '["tag2"]', 'bimou', '白萌', '这是白萌的个人简介', '1988-02-02', '中国', '上海市浦东新区', 0, 2, 2, 0),
    ('cimou', 'wx_union_cimou', 'mp_open_cimou', 'cimou@example.com', '13800138003', '370101198903032345', '47ec2dd791e31e2ef2076caf64ed9b3d', 'https://example.com/avatar_cimou3.jpg', '["tag3"]', 'cimou', '陈明', '这是陈明的个人简介', '1989-03-03', '中国', '广州市天河区', 0, 1, 1, 0),
    ('dimou', 'wx_union_dimou', 'mp_open_dimou', 'dimou@example.com', '13800138004', '370101199004042345', '47ec2dd791e31e2ef2076caf64ed9b3d', 'https://example.com/avatar_dimou4.jpg', '["tag4"]', 'dimou', '邓梅', '这是邓梅的个人简介', '1990-04-04', '中国', '深圳市福田区', 0, 1, 2, 0),
    ('eimou', 'wx_union_eimou', 'mp_open_eimou', 'eimou@example.com', '13800138005', '370101199105052345', '47ec2dd791e31e2ef2076caf64ed9b3d', 'https://example.com/avatar_eimou5.jpg', '["tag5"]', 'eimou', '易萌', '这是易萌的个人简介', '1991-05-05', '中国', '天津市和平区', 0, 2, 1, 0),
    ('fimou', 'wx_union_fimou', 'mp_open_fimou', 'fimou@example.com', '13800138006', '370101199206062345', '47ec2dd791e31e2ef2076caf64ed9b3d', 'https://example.com/avatar_fimou6.jpg', '["tag6"]', 'fimou', '范敏', '这是范敏的个人简介', '1992-06-06', '中国', '北京市海淀区', 0, 1, 2, 0),
    ('gimou', 'wx_union_gimou', 'mp_open_gimou', 'gimou@example.com', '13800138007', '370101199307072345', '47ec2dd791e31e2ef2076caf64ed9b3d', 'https://example.com/avatar_gimou7.jpg', '["tag7"]', 'gimou', '高梅', '这是高梅的个人简介', '1993-07-07', '中国', '上海市黄浦区', 0, 1, 1, 0),
    ('himou', 'wx_union_himou', 'mp_open_himou', 'himou@example.com', '13800138008', '370101199408082345', '47ec2dd791e31e2ef2076caf64ed9b3d', 'https://example.com/avatar_himou8.jpg', '["tag8"]', 'himou', '黄敏', '这是黄敏的个人简介', '1994-08-08', '中国', '广州市越秀区', 0, 2, 2, 0),
    ('iimou', 'wx_union_iimou', 'mp_open_iimou', 'iimou@example.com', '13800138009', '370101199509092345', '47ec2dd791e31e2ef2076caf64ed9b3d', 'https://example.com/avatar_iimou9.jpg', '["tag9"]', 'iimou', '冯萌', '这是冯萌的个人简介', '1995-09-09', '中国', '深圳市南山区', 0, 1, 1, 0),
    ('jimou', 'wx_union_jimou', 'mp_open_jimou', 'jimou@example.com', '13800138010', '370101199610102345', '47ec2dd791e31e2ef2076caf64ed9b3d', 'https://example.com/avatar_jimou10.jpg', '["tag10"]', 'jimou', '贾梅', '这是贾梅的个人简介', '1996-10-10', '中国', '天津市南开区', 0, 2, 2, 0),
    ('kimou', 'wx_union_kimou', 'mp_open_kimou', 'kimou@example.com', '13800138011', '370101199711112345', '47ec2dd791e31e2ef2076caf64ed9b3d', 'https://example.com/avatar_kimou11.jpg', '["tag11"]', 'kimou', '康铭', '这是康铭的个人简介', '1997-11-11', '中国', '上海市静安区', 0, 1, 1, 0),
    ('limou', 'wx_union_limou', 'mp_open_limou', 'limou@example.com', '13800138012', '370101199812122345', '47ec2dd791e31e2ef2076caf64ed9b3d', 'https://avatars.githubusercontent.com/u/113878415?s=400&u=9f10b63e033c9504615bc475581441478424e04b&v=4', '["项目架构师, 后端程序员, 数学爱好者, 运维发烧者"]', 'limou', '李陌', '这是李萌的个人简介', '2004-02-23', '中国', '广州市白云区', 1, 1, 1, 0),
    ('mimou', 'wx_union_mimou', 'mp_open_mimou', 'mimou@example.com', '13800138016', '370101200204162345', '47ec2dd791e31e2ef2076caf64ed9b3d', 'https://example.com/avatar_mimou16.jpg', '["tag16"]', 'mimou', '莫敏', '这是莫敏的个人简介', '2002-04-16', '中国', '北京市西城区', 0, 1, 1, 0),
    ('nimou', 'wx_union_nimou', 'mp_open_nimou', 'nimou@example.com', '13800138017', '370101200305172345', '47ec2dd791e31e2ef2076caf64ed9b3d', 'https://example.com/avatar_nimou17.jpg', '["tag17"]', 'nimou', '牛梅', '这是牛梅的个人简介', '2003-05-17', '中国', '上海市徐汇区', 0, 1, 2, 0),
    ('oimou', 'wx_union_oimou', 'mp_open_oimou', 'oimou@example.com', '13800138018', '370101200406182345', '47ec2dd791e31e2ef2076caf64ed9b3d', 'https://example.com/avatar_oimou18.jpg', '["tag18"]', 'oimou', '欧阳敏', '这是欧阳敏的个人简介', '2004-06-18', '中国', '深圳市龙华区',0, 2, 1, 0),
    ('pimou', 'wx_union_pimou', 'mp_open_pimou', 'pimou@example.com', '13800138019', '370101200507192345', '47ec2dd791e31e2ef2076caf64ed9b3d', 'https://example.com/avatar_pimou19.jpg', '["tag19"]', 'pimou', '潘萌', '这是潘萌的个人简介', '2005-07-19', '中国', '广州市花都区', 0, 1, 1, 0),
    ('qimou', 'wx_union_qimou', 'mp_open_qimou', 'qimou@example.com', '13800138020', '370101200608202345', '47ec2dd791e31e2ef2076caf64ed9b3d', 'https://example.com/avatar_qimou20.jpg', '["tag20"]', 'qimou', '曲敏', '这是曲敏的个人简介', '2006-08-20', '中国', '上海市杨浦区', 0, 2, 2, 0),
    ('rimou', 'wx_union_rimou', 'mp_open_rimou', 'rimou@example.com', '13800138021', '370101200709212345', '47ec2dd791e31e2ef2076caf64ed9b3d', 'https://example.com/avatar_rimou21.jpg', '["tag21"]', 'rimou', '任梅', '这是任梅的个人简介', '2007-09-21', '中国', '天津市武清区', 0, 1, 1, 0),
    ('simou', 'wx_union_simou', 'mp_open_simou', 'simou@example.com', '13800138022', '370101200810222345', '47ec2dd791e31e2ef2076caf64ed9b3d', 'https://example.com/avatar_simou22.jpg', '["tag22"]', 'simou', '孙萌', '这是孙萌的个人简介', '2008-10-22', '中国', '北京市昌平区', 0, 1, 2, 0),
    ('timou', 'wx_union_timou', 'mp_open_timou', 'timou@example.com', '13800138023', '370101200911232345', '47ec2dd791e31e2ef2076caf64ed9b3d', 'https://example.com/avatar_timou23.jpg', '["tag23"]', 'timou', '陶敏', '这是陶敏的个人简介', '2009-11-23', '中国', '上海市宝山区', 0, 1, 1, 0),
    ('uimou', 'wx_union_uimou', 'mp_open_uimou', 'uimou@example.com', '13800138024', '370101201012242345', '47ec2dd791e31e2ef2076caf64ed9b3d', 'https://example.com/avatar_uimou24.jpg', '["tag24"]', 'uimou', '吴梅', '这是吴梅的个人简介', '2010-12-24', '中国', '深圳市龙岗区', 0, 2, 2, 0),
    ('vimou', 'wx_union_vimou', 'mp_open_vimou', 'vimou@example.com', '13800138025', '370101201112252345', '47ec2dd791e31e2ef2076caf64ed9b3d', 'https://example.com/avatar_vimou25.jpg', '["tag25"]', 'vimou', '韦敏', '这是韦敏的个人简介', '2011-12-25', '中国', '广州市荔湾区', 0, 2, 1, 0),
    ('wimou', 'wx_union_wimou', 'mp_open_wimou', 'wimou@example.com', '13800138026', '370101201212262345', '47ec2dd791e31e2ef2076caf64ed9b3d', 'https://example.com/avatar_wimou26.jpg', '["tag26"]', 'wimou', '魏萌', '这是魏萌的个人简介', '2012-12-26', '中国', '上海市虹口区', 0, 1, 1, 0),
    ('ximou', 'wx_union_ximou', 'mp_open_ximou', 'ximou@example.com', '13800138027', '370101201312272345', '47ec2dd791e31e2ef2076caf64ed9b3d', 'https://example.com/avatar_ximou27.jpg', '["tag27"]', 'ximou', '谢敏', '这是谢敏的个人简介', '2013-12-27', '中国', '深圳市南山区', 0, 1, 2, 0),
    ('yimou', 'wx_union_yimou', 'mp_open_yimou', 'yimou@example.com', '13800138028', '370101201412282345', '47ec2dd791e31e2ef2076caf64ed9b3d', 'https://example.com/avatar_yimou28.jpg', '["tag28"]', 'yimou', '杨萌', '这是杨萌的个人简介', '2014-12-28', '中国', '北京市朝阳区', 0, 1, 1, 0),
    ('zimou', 'wx_union_zimou', 'mp_open_zimou', 'zimou@example.com', '13800138029', '370101201512292345', '47ec2dd791e31e2ef2076caf64ed9b3d', 'https://example.com/avatar_zimou29.jpg', '["tag29"]', 'zimou', '张敏', '这是张敏的个人简介', '2015-12-29', '中国', '上海市浦东新区', 0, 2, 2, 0)
;
