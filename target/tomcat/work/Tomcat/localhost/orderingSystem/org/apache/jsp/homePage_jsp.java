/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.37
 * Generated at: 2017-04-13 07:48:08 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class homePage_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private javax.el.ExpressionFactory _el_expressionfactory;
  private org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
    _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
        throws java.io.IOException, javax.servlet.ServletException {

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/html4/loose.dtd\">\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\r\n");
      out.write("<title>主页</title>\r\n");
      out.write("<script src=\"");
      out.print(request.getContextPath() );
      out.write("/js/jquery.min.js\"></script>\r\n");
      out.write("<script>\r\n");
      out.write("\t$(function() {\r\n");
      out.write("\t\tchangeFrameHeight();\r\n");
      out.write("\t\t$(\".meun-item\").click(function() {\r\n");
      out.write("\t\t\t$(\".meun-item\").removeClass(\"meun-item-active\");\r\n");
      out.write("\t\t\t$(this).addClass(\"meun-item-active\");\r\n");
      out.write("\t\t\tvar itmeObj = $(\".meun-item\").find(\"img\");\r\n");
      out.write("\t\t\titmeObj.each(function() {\r\n");
      out.write("\t\t\t\tvar items = $(this).attr(\"src\");\r\n");
      out.write("\t\t\t\titems = items.replace(\"_grey.png\", \".png\");\r\n");
      out.write("\t\t\t\titems = items.replace(\".png\", \"_grey.png\")\r\n");
      out.write("\t\t\t\t$(this).attr(\"src\", items);\r\n");
      out.write("\t\t\t});\r\n");
      out.write("\t\t\tvar attrObj = $(this).find(\"img\").attr(\"src\");;\r\n");
      out.write("\t\t\tattrObj = attrObj.replace(\"_grey.png\", \".png\");\r\n");
      out.write("\t\t\t$(this).find(\"img\").attr(\"src\", attrObj);\r\n");
      out.write("\t\t});\r\n");
      out.write("\t\t$(\"#topAD\").click(function() {\r\n");
      out.write("\t\t\t$(\"#topA\").toggleClass(\" glyphicon-triangle-right\");\r\n");
      out.write("\t\t\t$(\"#topA\").toggleClass(\" glyphicon-triangle-bottom\");\r\n");
      out.write("\t\t});\r\n");
      out.write("\t\t$(\"#topBD\").click(function() {\r\n");
      out.write("\t\t\t$(\"#topB\").toggleClass(\" glyphicon-triangle-right\");\r\n");
      out.write("\t\t\t$(\"#topB\").toggleClass(\" glyphicon-triangle-bottom\");\r\n");
      out.write("\t\t});\r\n");
      out.write("\t\t$(\"#topCD\").click(function() {\r\n");
      out.write("\t\t\t$(\"#topC\").toggleClass(\" glyphicon-triangle-right\");\r\n");
      out.write("\t\t\t$(\"#topC\").toggleClass(\" glyphicon-triangle-bottom\");\r\n");
      out.write("\t\t});\r\n");
      out.write("\t\t$(\".toggle-btn\").click(function() {\r\n");
      out.write("\t\t\t$(\"#leftMeun\").toggleClass(\"show\");\r\n");
      out.write("\t\t\t$(\"#rightContent\").toggleClass(\"pd0px\");\r\n");
      out.write("\t\t});\r\n");
      out.write("\t})\r\n");
      out.write("\t\r\n");
      out.write("\twindow.onresize = function(){\r\n");
      out.write("\t\tchangeFrameHeight();\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("\tfunction changeFrameHeight(){\r\n");
      out.write("\t\tvar ifm = $(\"#myframe\");\r\n");
      out.write("\t\tifm.height=$(document).height();\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("\tfunction toURL(url) {\r\n");
      out.write("\t\t$(\"#myframe\").attr(\"src\", url);\r\n");
      out.write("\t}\r\n");
      out.write("</script>\r\n");
      out.write("<link href=\"");
      out.print(request.getContextPath() );
      out.write("/css/bootstrap.min.css\" rel=\"stylesheet\">\r\n");
      out.write("<link rel=\"stylesheet\" type=\"text/css\" href=\"");
      out.print(request.getContextPath() );
      out.write("/css/common.css\" />\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("\t<div id=\"wrap\">\r\n");
      out.write("\t\t<!-- 左侧菜单栏目块 -->\r\n");
      out.write("\t\t<div class=\"leftMeun\" id=\"leftMeun\">\r\n");
      out.write("\t\t\t<div id=\"logoDiv\">\r\n");
      out.write("\t\t\t\t<p id=\"logoP\"><img id=\"logo\" alt=\"我的主页\" src=\"");
      out.print(request.getContextPath() );
      out.write("/images/logo.png\"><span>我的主页</span></p>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t\t<div id=\"personInfor\">\r\n");
      out.write("\t\t\t\t<p id=\"userName\"> ");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${user.username}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("</p>\r\n");
      out.write("\t\t\t\t<p><span>");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${user.email}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("</span></p>\r\n");
      out.write("\t\t\t\t<p>\r\n");
      out.write("\t\t\t\t\t<a href=\"");
      out.print(request.getContextPath() );
      out.write("/index.jsp\">退出登录</a><br><br>\r\n");
      out.write("\t\t\t\t\t<a href=\"");
      out.print(request.getContextPath() );
      out.write("/myTimer/startTimer.do\">开始接单</a>\r\n");
      out.write("\t\t\t\t</p>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t\t<div class=\"meun-title\">后台管理</div>\r\n");
      out.write("\t\t\t<div class=\"meun-item meun-item-active\" href=\"#sour\" aria-controls=\"sour\" role=\"tab\" data-toggle=\"tab\"\r\n");
      out.write("\t\t\t\tonClick=\"toURL('");
      out.print(request.getContextPath() );
      out.write("/orderInfo/pageList.do')\">\r\n");
      out.write("\t\t\t<img src=\"");
      out.print(request.getContextPath() );
      out.write("/images/icon_source.png\">订单管理</div>\r\n");
      out.write("\t\t\t<div class=\"meun-item\" href=\"#char\" aria-controls=\"char\" role=\"tab\" data-toggle=\"tab\"\r\n");
      out.write("\t\t\t\tonClick=\"toURL('");
      out.print(request.getContextPath() );
      out.write("/userManagement/pageList.do')\">\r\n");
      out.write("\t\t\t<img src=\"");
      out.print(request.getContextPath() );
      out.write("/images/icon_chara_grey.png\">用户管理</div>\r\n");
      out.write("\t\t\t<div class=\"meun-item\" href=\"#user\" aria-controls=\"user\" role=\"tab\" data-toggle=\"tab\"\r\n");
      out.write("\t\t\t\tonClick=\"toURL('");
      out.print(request.getContextPath() );
      out.write("/foodInfo/pageList.do')\">\r\n");
      out.write("\t\t\t<img src=\"");
      out.print(request.getContextPath() );
      out.write("/images/icon_user_grey.png\">菜品管理</div>\r\n");
      out.write("\t\t\t<div class=\"meun-item\" href=\"#user\" aria-controls=\"user\" role=\"tab\" data-toggle=\"tab\"\r\n");
      out.write("\t\t\t\tonClick=\"toURL('");
      out.print(request.getContextPath() );
      out.write("/foodClass/pageList.do')\">\r\n");
      out.write("\t\t\t<img src=\"");
      out.print(request.getContextPath() );
      out.write("/images/icon_user_grey.png\">菜品种类管理</div>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t<!-- 右侧具体内容栏目 -->\r\n");
      out.write("\t\t<div id=\"rightContent\">\r\n");
      out.write("\t\t\t<iframe id=\"myframe\" width=\"100%\" height=\"740px;\" src=\"\"></iframe>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t</div>\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try { out.clearBuffer(); } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
