<%--
  Created by IntelliJ IDEA.
  User: 1643053
  Date: 2022-10-03
  Time: 오후 2:27
  To change this template use File | Settings | File Templates.
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Insert title here</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <link
          href="https://fonts.googleapis.com/css2?family=Anton&family=Edu+VIC+WA+NT+Beginner:wght@600&family=Gamja+Flower&family=Single+Day&family=Jua&family=Nanum+Pen+Script&display=swap"
          rel="stylesheet">
  <script src="https://code.jquery.com/jquery-3.5.0.js"></script>
  <link rel="stylesheet" type="text/css" href="${root}/resources/css/timetable.css" />
  <style type="text/css">
    *{
      font-family: 'Jua';
    }
  </style>
</head>
<body>

<div class="container">
  <div class="tablehead">

  </div>
  <div class="lectime">
    <th>월</th><th>화</th><th>수</th><th>목</th><th>금</th><th>토</th><th>일</th>
  </div>
  <div class="tablecontent">

  </div>
</div>

<div class="wrap" style="width: 416px;">
  <div class="tablehead">
    <table class="tablehead">
      <tbody>
      <tr>
        <th></th>
        <td>월</td>
        <td>화</td>
        <td>수</td>
        <td>목</td>
        <td>금</td>
        <td style="display: none;">토</td>
        <td style="display: none;">일</td>
        <th></th>
      </tr>
      </tbody>
    </table>
  </div>
  <div class="tablebody">
    <table class="tablebody" style="margin-top: 0px;">
      <tbody>
      <tr>
        <th>
          <div class="hours">

            <div class="hour" style="height: 60px; top: 399.907px; line-height: 60px;">1교시</div>
            <div class="hour" style="height: 60px; top: 474.896px; line-height: 60px;">2교시</div>
            <div class="hour" style="height: 60px; top: 549.873px; line-height: 60px;">3교시</div>
            <div class="hour" style="height: 60px; top: 624.861px; line-height: 60px;">4교시</div>
            <div class="hour" style="height: 60px; top: 699.838px; line-height: 60px;">5교시</div>
            <div class="hour" style="height: 60px; top: 774.826px; line-height: 60px;">6교시</div>
            <div class="hour" style="height: 60px; top: 849.803px; line-height: 60px;">7교시</div>
            <div class="hour" style="height: 60px; top: 924.792px; line-height: 60px;">8교시</div>
            <div class="hour" style="height: 60px; top: 999.769px; line-height: 60px;">9교시</div>
            <div class="hour" style="height: 60px; top: 1074.76px; line-height: 60px;">10교시</div>
            <div class="hour" style="height: 60px; top: 324.931px; line-height: 60px;">11교시</div>
            <div class="hour" style="height: 60px; top: 324.931px; line-height: 60px;">12교시</div>
            <div class="hour" style="height: 60px; top: 324.931px; line-height: 60px;">13교시</div>
            <div class="hour" style="height: 50px; top: 1149.73px; line-height: 50px;"></div>
          </div>
        </th>
        <td>
          <div class="cols" style="width: 58px;">
            <div class="subject color4" style="height: 76px; top: 549.873px;">
              <ul class="status" style="display: none;">
                <li title="삭제" class="del"></li>
              </ul>
              <h3>교양합창</h3>
              <p><em>김동근</em><span>대강당</span></p></div>
            <div class="subject color6" style="height: 76px; top: 624.861px;">
              <ul class="status">
                <li title="삭제" class="del"></li>
              </ul>
              <h3>국문서기획및관리</h3>
              <p><em>박경옥</em><span>경영B117</span></p></div>
            <div class="subject color7" style="height: 76px; top: 774.826px;">
              <ul class="status">
                <li title="삭제" class="del"></li>
              </ul>
              <h3>비즈니스매너와프로토콜</h3>
              <p><em>황혜진</em><span>경영508</span></p></div>
          </div>
          <div class="grids">
            <div class="grid"></div>
            <div class="grid"></div>
            <div class="grid"></div>
            <div class="grid"></div>
            <div class="grid"></div>
            <div class="grid"></div>
            <div class="grid"></div>
            <div class="grid"></div>
            <div class="grid"></div>
            <div class="grid"></div>
            <div class="grid"></div>
            <div class="grid"></div>
            <div class="grid"></div>
            <div class="grid"></div>
            <div class="grid"></div>
            <div class="grid"></div>
            <div class="grid"></div>
            <div class="grid"></div>
            <div class="grid"></div>
            <div class="grid"></div>
            <div class="grid"></div>
            <div class="grid"></div>
            <div class="grid"></div>
            <div class="grid"></div>
          </div>
        </td>
        <td>
          <div class="cols" style="width: 58px;">
            <div class="subject color2" style="height: 76px; top: 849.803px;">
              <ul class="status">
                <li title="삭제" class="del"></li>
              </ul>
              <h3>대학영어</h3>
              <p><em>Thomas E. Webster</em><span>캠B131</span></p></div>
            <div class="subject color3" style="height: 76px; top: 624.861px;">
              <ul class="status">
                <li title="삭제" class="del"></li>
              </ul>
              <h3>디지털매체와예술</h3>
              <p><em>최유미</em><span>학414</span></p></div>
            <div class="subject color5" style="height: 151px; top: 699.838px;">
              <ul class="status">
                <li title="삭제" class="del"></li>
              </ul>
              <h3>미래학입문</h3>
              <p><em>민병주</em><span>정보B01</span></p></div>
          </div>
          <div class="grids">
            <div class="grid"></div>
            <div class="grid"></div>
            <div class="grid"></div>
            <div class="grid"></div>
            <div class="grid"></div>
            <div class="grid"></div>
            <div class="grid"></div>
            <div class="grid"></div>
            <div class="grid"></div>
            <div class="grid"></div>
            <div class="grid"></div>
            <div class="grid"></div>
            <div class="grid"></div>
            <div class="grid"></div>
            <div class="grid"></div>
            <div class="grid"></div>
            <div class="grid"></div>
            <div class="grid"></div>
            <div class="grid"></div>
            <div class="grid"></div>
            <div class="grid"></div>
            <div class="grid"></div>
            <div class="grid"></div>
            <div class="grid"></div>
          </div>
        </td>
        <td>
          <div class="cols" style="width: 58px;">
            <div class="subject color1" style="height: 76px; top: 474.896px;">
              <ul class="status" style="display: none;">
                <li title="삭제" class="del"></li>
              </ul>
              <h3>채플</h3>
              <p><em></em><span>대강당</span></p></div>
            <div class="subject color3" style="height: 76px; top: 624.861px;">
              <ul class="status">
                <li title="삭제" class="del"></li>
              </ul>
              <h3>디지털매체와예술</h3>
              <p><em>최유미</em><span>학414</span></p></div>
            <div class="subject color7" style="height: 76px; top: 699.838px;">
              <ul class="status">
                <li title="삭제" class="del"></li>
              </ul>
              <h3>비즈니스매너와프로토콜</h3>
              <p><em>황혜진</em><span>경영508</span></p></div>
          </div>
          <div class="grids">
            <div class="grid"></div>
            <div class="grid"></div>
            <div class="grid"></div>
            <div class="grid"></div>
            <div class="grid"></div>
            <div class="grid"></div>
            <div class="grid"></div>
            <div class="grid"></div>
            <div class="grid"></div>
            <div class="grid"></div>
            <div class="grid"></div>
            <div class="grid"></div>
            <div class="grid"></div>
            <div class="grid"></div>
            <div class="grid"></div>
            <div class="grid"></div>
            <div class="grid"></div>
            <div class="grid"></div>
            <div class="grid"></div>
            <div class="grid"></div>
            <div class="grid"></div>
            <div class="grid"></div>
            <div class="grid"></div>
            <div class="grid"></div>
          </div>
        </td>
        <td>
          <div class="cols" style="width: 58px;">
            <div class="subject color2" style="height: 76px; top: 774.826px;">
              <ul class="status">
                <li title="삭제" class="del"></li>
              </ul>
              <h3>대학영어</h3>
              <p><em>Thomas E. Webster</em><span>캠B131</span></p></div>
            <div class="subject color4" style="height: 76px; top: 624.861px;">
              <ul class="status">
                <li title="삭제" class="del"></li>
              </ul>
              <h3>교양합창</h3>
              <p><em>김동근</em><span>대강당</span></p></div>
            <div class="subject color6" style="height: 76px; top: 699.838px;">
              <ul class="status">
                <li title="삭제" class="del"></li>
              </ul>
              <h3>국문서기획및관리</h3>
              <p><em>박경옥</em><span>경영B117</span></p></div>
          </div>
          <div class="grids">
            <div class="grid"></div>
            <div class="grid"></div>
            <div class="grid"></div>
            <div class="grid"></div>
            <div class="grid"></div>
            <div class="grid"></div>
            <div class="grid"></div>
            <div class="grid"></div>
            <div class="grid"></div>
            <div class="grid"></div>
            <div class="grid"></div>
            <div class="grid"></div>
            <div class="grid"></div>
            <div class="grid"></div>
            <div class="grid"></div>
            <div class="grid"></div>
            <div class="grid"></div>
            <div class="grid"></div>
            <div class="grid"></div>
            <div class="grid"></div>
            <div class="grid"></div>
            <div class="grid"></div>
            <div class="grid"></div>
            <div class="grid"></div>
          </div>
        </td>
        <td>
          <div class="cols" style="width: 58px;"></div>
          <div class="grids">
            <div class="grid"></div>
            <div class="grid"></div>
            <div class="grid"></div>
            <div class="grid"></div>
            <div class="grid"></div>
            <div class="grid"></div>
            <div class="grid"></div>
            <div class="grid"></div>
            <div class="grid"></div>
            <div class="grid"></div>
            <div class="grid"></div>
            <div class="grid"></div>
            <div class="grid"></div>
            <div class="grid"></div>
            <div class="grid"></div>
            <div class="grid"></div>
            <div class="grid"></div>
            <div class="grid"></div>
            <div class="grid"></div>
            <div class="grid"></div>
            <div class="grid"></div>
            <div class="grid"></div>
            <div class="grid"></div>
            <div class="grid"></div>
          </div>
        </td>
        <td style="display: none;">
          <div class="cols"></div>
          <div class="grids">
            <div class="grid"></div>
            <div class="grid"></div>
            <div class="grid"></div>
            <div class="grid"></div>
            <div class="grid"></div>
            <div class="grid"></div>
            <div class="grid"></div>
            <div class="grid"></div>
            <div class="grid"></div>
            <div class="grid"></div>
            <div class="grid"></div>
            <div class="grid"></div>
            <div class="grid"></div>
            <div class="grid"></div>
            <div class="grid"></div>
            <div class="grid"></div>
            <div class="grid"></div>
            <div class="grid"></div>
            <div class="grid"></div>
            <div class="grid"></div>
            <div class="grid"></div>
            <div class="grid"></div>
            <div class="grid"></div>
            <div class="grid"></div>
          </div>
        </td>
        <td style="display: none;">
          <div class="cols"></div>
          <div class="grids">
            <div class="grid"></div>
            <div class="grid"></div>
            <div class="grid"></div>
            <div class="grid"></div>
            <div class="grid"></div>
            <div class="grid"></div>
            <div class="grid"></div>
            <div class="grid"></div>
            <div class="grid"></div>
            <div class="grid"></div>
            <div class="grid"></div>
            <div class="grid"></div>
            <div class="grid"></div>
            <div class="grid"></div>
            <div class="grid"></div>
            <div class="grid"></div>
            <div class="grid"></div>
            <div class="grid"></div>
            <div class="grid"></div>
            <div class="grid"></div>
            <div class="grid"></div>
            <div class="grid"></div>
            <div class="grid"></div>
            <div class="grid"></div>
          </div>
        </td>
        <th>
          <div class="times">
            <div class="time">오전 0시</div>
            <div class="time">오전 1시</div>
            <div class="time">오전 2시</div>
            <div class="time">오전 3시</div>
            <div class="time">오전 4시</div>
            <div class="time">오전 5시</div>
            <div class="time">오전 6시</div>
            <div class="time">오전 7시</div>
            <div class="time">오전 8시</div>
            <div class="time">오전 9시</div>
            <div class="time">오전 10시</div>
            <div class="time">오전 11시</div>
            <div class="time">오후 12시</div>
            <div class="time">오후 1시</div>
            <div class="time">오후 2시</div>
            <div class="time">오후 3시</div>
            <div class="time">오후 4시</div>
            <div class="time">오후 5시</div>
            <div class="time">오후 6시</div>
            <div class="time">오후 7시</div>
            <div class="time">오후 8시</div>
            <div class="time">오후 9시</div>
            <div class="time">오후 10시</div>
            <div class="time">오후 11시</div>
          </div>
        </th>
      </tr>
      </tbody>
    </table>
  </div>
</div>
</body>
</html>