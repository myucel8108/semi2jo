<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div id="hidectrl" class="middle hide-nickname hide-hideempty"><div class="lessons"><table cellspacing="0" class=""><thead><tr><th class="t">교시</th><td>월</td><td>화</td><td>수</td><td>목</td><td>금</td><td class="d6">토</td><td class="d7">일</td><th>시각</th></tr></thead><tbody id="lessons" class=""><script>(function() {
    var s = [], T = [390,480,570,660,750,840,930,1020,1110];
    var f00 = function(n) { return (n + 100).toString().substring(1) };
    for (var i = 0; i <= 8; ++i) {
        s.push('<tr class=r', i, '><th class=t>', i);
        for (var j = 1; j <= 7; ++j)
            s.push('<td class=d', j, ' id=c', i * 10 + j, '><i></i>');
        s.push('<th>', f00(T[i] / 60 | 0), ':', f00(T[i] % 60));
    }
    document.write(s.join(''));
})();
</script>
<tr class="r0">
    <th class="t">0</th>
    <td class="d1" id="c1"><i></i></td>
    <td class="d2" id="c2"><i></i></td>
    <td class="d3" id="c3"><i></i></td>
    <td class="d4" id="c4"><i></i></td>
    <td class="d5" id="c5"><i></i></td>
    <td class="d6" id="c6"><i></i></td>
    <td class="d7" id="c7"><i></i></td>
    <th>06:30</th>
</tr>
<tr class="r1">
    <th class="t">1</th>
    <td class="d1" id="c11"><i></i></td>
    <td class="d2" id="c12"><i></i></td>
    <td class="d3" id="c13"><i></i></td>
    <td class="d4" id="c14"><i></i></td>
    <td class="d5" id="c15"><i></i></td>
    <td class="d6" id="c16"><i></i></td>
    <td class="d7" id="c17"><i></i></td>
    <th>08:00</th>
</tr>
<tr class="r2">
    <th class="t">2</th>
    <td class="d1" id="c21"><i></i></td>
    <td class="d2" id="c22"><i></i></td>
    <td class="d3" id="c23"><i></i></td>
    <td class="d4" id="c24"><i></i></td>
    <td class="d5 non-empty" id="c25"><i></i>
        <p class="o11 n93799"><a href="#" class="remove">삭제</a><a href="#" class="title">비즈니스매너와프로토콜</a><a href="#"
                                                                                                           class="nickname">
            비즈니스매너와프로토콜</a><span class="lecturer"> 고혜경</span><span class="location"> 경영312</span></p></td>
    <td class="d6" id="c26"><i></i></td>
    <td class="d7" id="c27"><i></i></td>
    <th>09:30</th>
</tr>
<tr class="r3">
    <th class="t">3</th>
    <td class="d1 non-empty" id="c31"><i></i>
        <p class="o5 n92368"><a href="#" class="remove">삭제</a><a href="#" class="title">컴퓨팅적사고와프로그래밍</a><a href="#"
                                                                                                           class="nickname">
            컴퓨팅적사고와프로그래밍</a><span class="lecturer"> 김명준</span><span class="location"> 캠B159</span></p></td>
    <td class="d2" id="c32"><i></i></td>
    <td class="d3 non-empty" id="c33"><i></i>
        <p class="o1 n91767"><a href="#" class="remove">삭제</a><a href="#" class="title">채플</a><a href="#" class="nickname">
            채플</a><span class="lecturer"> </span><span class="location"> 대강당</span></p>
        <p class="o11 n93799"><a href="#" class="remove">삭제</a><a href="#" class="title">비즈니스매너와프로토콜</a><a href="#"
                                                                                                           class="nickname">
            비즈니스매너와프로토콜</a><span class="lecturer"> 고혜경</span><span class="location"> 경영312</span></p></td>
    <td class="d4 non-empty" id="c34"><i></i>
        <p class="o2 n91768"><a href="#" class="remove">삭제</a><a href="#" class="title">채플</a><a href="#" class="nickname">
            채플</a><span class="lecturer"> </span><span class="location"> 대강당</span></p></td>
    <td class="d5" id="c35"><i></i></td>
    <td class="d6" id="c36"><i></i></td>
    <td class="d7" id="c37"><i></i></td>
    <th>11:00</th>
</tr>
<tr class="r4">
    <th class="t">4</th>
    <td class="d1 non-empty" id="c41"><i></i>
        <p class="o8 n92739"><a href="#" class="remove">삭제</a><a href="#" class="title">인간관계론</a><a href="#"
                                                                                                    class="nickname">
            인간관계론</a><span class="lecturer"> 박경옥</span><span class="location"> 경영312</span></p></td>
    <td class="d2" id="c42"><i></i></td>
    <td class="d3 non-empty" id="c43"><i></i>
        <p class="o6 n92369"><a href="#" class="remove">삭제</a><a href="#" class="title">글로벌커리어개발과기업가정신</a><a href="#"
                                                                                                             class="nickname">
            글로벌커리어개발과기업가정신</a><span class="lecturer"> 백지연</span><span class="location"> 경영101</span></p></td>
    <td class="d4 non-empty" id="c44"><i></i>
        <p class="o5 n92368"><a href="#" class="remove">삭제</a><a href="#" class="title">컴퓨팅적사고와프로그래밍</a><a href="#"
                                                                                                           class="nickname">
            컴퓨팅적사고와프로그래밍</a><span class="lecturer"> 김명준</span><span class="location"> 경영B117</span></p>
        <p class="o10 n93098"><a href="#" class="remove">삭제</a><a href="#" class="title">고급비즈니스컴퓨팅</a><a href="#"
                                                                                                         class="nickname">
            고급비즈니스컴퓨팅</a><span class="lecturer"> 김명옥</span><span class="location"> 경영B120</span></p></td>
    <td class="d5" id="c45"><i></i></td>
    <td class="d6" id="c46"><i></i></td>
    <td class="d7" id="c47"><i></i></td>
    <th>12:30</th>
</tr>
<tr class="r5">
    <th class="t">5</th>
    <td class="d1 non-empty" id="c51"><i></i>
        <p class="o6 n92369"><a href="#" class="remove">삭제</a><a href="#" class="title">글로벌커리어개발과기업가정신</a><a href="#"
                                                                                                             class="nickname">
            글로벌커리어개발과기업가정신</a><span class="lecturer"> 백지연</span><span class="location"> 경영101</span></p></td>
    <td class="d2" id="c52"><i></i></td>
    <td class="d3 non-empty" id="c53"><i></i>
        <p class="o9 n93001"><a href="#" class="remove">삭제</a><a href="#" class="title">Business Writing</a><a href="#"
                                                                                                               class="nickname">
            Business Writing</a><span class="lecturer"> 전지현</span><span class="location"> 경영B117</span></p></td>
    <td class="d4 non-empty" id="c54"><i></i>
        <p class="o8 n92739"><a href="#" class="remove">삭제</a><a href="#" class="title">인간관계론</a><a href="#"
                                                                                                    class="nickname">
            인간관계론</a><span class="lecturer"> 박경옥</span><span class="location"> 경영312</span></p></td>
    <td class="d5" id="c55"><i></i></td>
    <td class="d6" id="c56"><i></i></td>
    <td class="d7" id="c57"><i></i></td>
    <th>14:00</th>
</tr>
<tr class="r6">
    <th class="t">6</th>
    <td class="d1 non-empty" id="c61"><i></i>
        <p class="o9 n93001"><a href="#" class="remove">삭제</a><a href="#" class="title">Business Writing</a><a href="#"
                                                                                                               class="nickname">
            Business Writing</a><span class="lecturer"> 전지현</span><span class="location"> 경영B117</span></p></td>
    <td class="d2 non-empty" id="c62"><i></i>
        <p class="o10 n93098"><a href="#" class="remove">삭제</a><a href="#" class="title">고급비즈니스컴퓨팅</a><a href="#"
                                                                                                         class="nickname">
            고급비즈니스컴퓨팅</a><span class="lecturer"> 김명옥</span><span class="location"> 경영B120</span></p></td>
    <td class="d3 non-empty" id="c63"><i></i>
        <p class="o4 n92353"><a href="#" class="remove">삭제</a><a href="#" class="title">스토리텔링과글쓰기</a><a href="#"
                                                                                                        class="nickname">
            스토리텔링과글쓰기</a><span class="lecturer"> 이진</span><span class="location"> 캠B221</span></p></td>
    <td class="d4 non-empty" id="c64"><i></i>
        <p class="o7 n92397"><a href="#" class="remove">삭제</a><a href="#" class="title">호모엠파티쿠스:소통·공감·신뢰</a><a href="#"
                                                                                                               class="nickname">
            호모엠파티쿠스:소통·공감·신뢰</a><span class="lecturer"> 이은아</span><span class="location"> 학510</span></p></td>
    <td class="d5" id="c65"><i></i></td>
    <td class="d6" id="c66"><i></i></td>
    <td class="d7" id="c67"><i></i></td>
    <th>15:30</th>
</tr>
<tr class="r7">
    <th class="t">7</th>
    <td class="d1 non-empty" id="c71"><i></i>
        <p class="o4 n92353"><a href="#" class="remove">삭제</a><a href="#" class="title">스토리텔링과글쓰기</a><a href="#"
                                                                                                        class="nickname">
            스토리텔링과글쓰기</a><span class="lecturer"> 이진</span><span class="location"> 캠B221</span></p></td>
    <td class="d2 non-empty" id="c72"><i></i>
        <p class="o7 n92397"><a href="#" class="remove">삭제</a><a href="#" class="title">호모엠파티쿠스:소통·공감·신뢰</a><a href="#"
                                                                                                               class="nickname">
            호모엠파티쿠스:소통·공감·신뢰</a><span class="lecturer"> 이은아</span><span class="location"> 학510</span></p></td>
    <td class="d3 non-empty" id="c73"><i></i>
        <p class="o3 n92084"><a href="#" class="remove">삭제</a><a href="#" class="title">인문학으로세상읽기</a><a href="#"
                                                                                                        class="nickname">
            인문학으로세상읽기</a><span class="lecturer"> 송기정</span><span class="location"> 캠B142</span></p></td>
    <td class="d4" id="c74"><i></i></td>
    <td class="d5" id="c75"><i></i></td>
    <td class="d6" id="c76"><i></i></td>
    <td class="d7" id="c77"><i></i></td>
    <th>17:00</th>
</tr>
<tr class="r8">
    <th class="t">8</th>
    <td class="d1" id="c81"><i></i></td>
    <td class="d2" id="c82"><i></i></td>
    <td class="d3" id="c83"><i></i></td>
    <td class="d4" id="c84"><i></i></td>
    <td class="d5" id="c85"><i></i></td>
    <td class="d6" id="c86"><i></i></td>
    <td class="d7" id="c87"><i></i></td>
    <th>18:30</th>
</tr>
</tbody>
</table>
</div>
    <ul id="nolesson" class="nolesson non-empty">
        <li credits="0" class="n91767"><a href="#" class="remove">삭제</a><span class="litid">00000-06 </span><a href="#"
                                                                                                               class="title">채플</a><a
                href="#" class="nickname"> 채플</a><span class="lecturer"> </span></li>
        <li credits="0" class="n91768"><a href="#" class="remove">삭제</a><span class="litid">00000-07 </span><a href="#"
                                                                                                               class="title">채플</a><a
                href="#" class="nickname"> 채플</a><span class="lecturer"> </span></li>
        <li credits="1" class="n92084"><a href="#" class="remove">삭제</a><span class="litid">10956-01 </span><a href="#"
                                                                                                               class="title">인문학으로세상읽기</a><a
                href="#" class="nickname"> 인문학으로세상읽기</a><span class="lecturer"> 송기정</span></li>
        <li credits="2" class="n92353"><a href="#" class="remove">삭제</a><span class="litid">11202-04 </span><a href="#"
                                                                                                               class="title">스토리텔링과글쓰기</a><a
                href="#" class="nickname"> 스토리텔링과글쓰기</a><span class="lecturer"> 이진</span></li>
        <li credits="3" class="n92368"><a href="#" class="remove">삭제</a><span class="litid">11211-01 </span><a href="#"
                                                                                                               class="title">컴퓨팅적사고와프로그래밍</a><a
                href="#" class="nickname"> 컴퓨팅적사고와프로그래밍</a><span class="lecturer"> 김명준</span></li>
        <li credits="3" class="n92369"><a href="#" class="remove">삭제</a><span class="litid">11212-01 </span><a href="#"
                                                                                                               class="title">글로벌커리어개발과기업가정신</a><a
                href="#" class="nickname"> 글로벌커리어개발과기업가정신</a><span class="lecturer"> 백지연</span></li>
        <li credits="2" class="n92397"><a href="#" class="remove">삭제</a><span class="litid">11255-01 </span><a href="#"
                                                                                                               class="title">호모엠파티쿠스:소통·공감·신뢰</a><a
                href="#" class="nickname"> 호모엠파티쿠스:소통·공감·신뢰</a><span class="lecturer"> 이은아</span></li>
        <li credits="3" class="n92739"><a href="#" class="remove">삭제</a><span class="litid">22285-01 </span><a href="#"
                                                                                                               class="title">인간관계론</a><a
                href="#" class="nickname"> 인간관계론</a><span class="lecturer"> 박경옥</span></li>
        <li credits="3" class="n93001"><a href="#" class="remove">삭제</a><span class="litid">34012-02 </span><a href="#"
                                                                                                               class="title">Business
            Writing</a><a href="#" class="nickname"> Business Writing</a><span class="lecturer"> 전지현</span></li>
        <li credits="3" class="n93098"><a href="#" class="remove">삭제</a><span class="litid">34622-02 </span><a href="#"
                                                                                                               class="title">고급비즈니스컴퓨팅</a><a
                href="#" class="nickname"> 고급비즈니스컴퓨팅</a><span class="lecturer"> 김명옥</span></li>
        <li credits="3" class="n93799"><a href="#" class="remove">삭제</a><span class="litid">36779-01 </span><a href="#"
                                                                                                               class="title">비즈니스매너와프로토콜</a><a
                href="#" class="nickname"> 비즈니스매너와프로토콜</a><span class="lecturer"> 고혜경</span></li>
    </ul>
</div>
</body>
</html>