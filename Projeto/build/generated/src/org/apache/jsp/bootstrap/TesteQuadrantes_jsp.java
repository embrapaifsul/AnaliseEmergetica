package org.apache.jsp.bootstrap;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import modelo.Propriedade;
import modelo.Passos;
import modelo.Usuario;
import java.util.List;
import dao.Lv1p1DAO;
import modelo.Lv1p1;

public final class TesteQuadrantes_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");

    Usuario u = new Usuario();
    Passos p;

    p = (Passos) session.getAttribute("Passos");

    p = new Passos();
    p.setAno(request.getParameter("data"));
    session.setAttribute("Passos", p);

    Propriedade pro = new Propriedade();
    u = (Usuario) session.getAttribute("Usuario");
    p = (Passos) session.getAttribute("Passos");
    pro = (Propriedade) session.getAttribute("Propriedade");



      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("\n");
      out.write("        <meta charset=\"utf-8\"/>\n");
      out.write("        <meta name=\"description\" content=\"Fazenda\"/>\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\"/>\n");
      out.write("\n");
      out.write("        <title>Fazenda</title>\n");
      out.write("        <link rel=\"stylesheet\" href=\"bootstrap/css/bootstrap.css\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"bootstrap/css/bootstrap-responsive.css\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"bootstrap/style.css\">\n");
      out.write("        <script src=\"//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js\"></script>\n");
      out.write("        <script>window.jQuery || document.write('<script src=\"js/jquery-1.7.1.min.js\"><\\/script>')</script>\n");
      out.write("        <script type=\"text/javascript\" src=\"bootstrap/js/bootstrap.js\"></script>\n");
      out.write("        <script type=\"text/javascript\" src=\"bootstrap/TesteJavaScript.js\"></script>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("\n");
      out.write("        <nav class=\"navbar navbar-fixed-top navbar-inverse\">\n");
      out.write("            <div class=\"navbar-inner\">\n");
      out.write("                <div class=\"container\">\n");
      out.write("                    <!-- .btn-navbar está classe é usada como alternador para o conteudo coplapsavel-->\n");
      out.write("                    <button class=\"btn btn-navbar\" data-toggle=\"collapse\" data-target=\".nav-collapse\">\n");
      out.write("                        <span class=\"icon-bar\"></span>\n");
      out.write("                        <span class=\"icon-bar\"></span>\n");
      out.write("                        <span class=\"icon-bar\"></span>\n");
      out.write("                    </button>\n");
      out.write("                    <a href=\"Inicio.jsp\" class=\"brand\">Fazenda</a>\n");
      out.write("\n");
      out.write("                    <div class=\"nav-collapse collapse\">\n");
      out.write("                        <ul class=\"nav\">\n");
      out.write("                            <li><a></a></li>\n");
      out.write("                            <li><a></a></li>\n");
      out.write("                            <li><a></a></li>\n");
      out.write("                            <li><a></a></li>\n");
      out.write("                            <li><a>Propriedade: ");
      out.print(pro.getNome());
      out.write("</a></li>\n");
      out.write("                            <li><a></a></li>\n");
      out.write("                            <li><a></a></li>\n");
      out.write("                            <li><a></a></li>\n");
      out.write("                            <li><a></a></li>\n");
      out.write("                            <li><a></a></li>\n");
      out.write("                            <li><a></a></li>\n");
      out.write("                            <li><a></a></li>\n");
      out.write("                            <li><a></a></li>\n");
      out.write("                            <li><a></a></li>\n");
      out.write("                            <li><a></a></li>\n");
      out.write("                            <li><a></a></li>\n");
      out.write("                            <li><a></a></li>\n");
      out.write("                            <li><a href=\"index.jsp\">Usuario: ");
      out.print(u.getLogin());
      out.write("</a></li>\n");
      out.write("                        </ul>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </nav>\n");
      out.write("\n");
      out.write("        <header class=\"page-header\"></header>\n");
      out.write("\n");
      out.write("        <div class=\"container-fluid\">\n");
      out.write("            <div class=\"row-fluid\">\n");
      out.write("\n");
      out.write("                <aside class=\"span10\">\n");
      out.write("                    <section id=\"breadcrumbs\">\n");
      out.write("                        <header class=\"page-header\">\n");
      out.write("                            <h3> Progresso </h3>\n");
      out.write("\n");
      out.write("                            <ul class=\"breadcrumb\">\n");
      out.write("                                <li><a href=\"AnoLv1.jsp\"> Data </a><span class=\"divider\"> / </span></li>\n");
      out.write("                                <li class=\"alert-error\"> Passo 1 </li><span class=\"divider\"> / </span>\n");
      out.write("                                <li><a href=\"Lv1-Passo2.jsp\"> Passo 2 </a><span class=\"divider\"> / </span></li>\n");
      out.write("                                <li><a href=\"Lv1-Passo3.jsp\"> Passo 3 </a><span class=\"divider\"> / </span></li>\n");
      out.write("                                <li><a href=\"Lv1-Passo4.jsp\"> Passo 4 </a><span class=\"divider\"> / </span></li>\n");
      out.write("                                <li><a href=\"Lv1-Saida.jsp\"> Resultados </a></li>\n");
      out.write("                            </ul>\n");
      out.write("                            <div class=\"progress\">\n");
      out.write("                                <div class=\"progress-bar\" role=\"progressbar\" aria-valuenow=\"20\" aria-valuemin=\"0\" aria-valuemax=\"100\" style=\"width: 20%;\">\n");
      out.write("                                    <span class=\"sr-only\">20% Completo</span>\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("                        </header>\n");
      out.write("\n");
      out.write("                    </section><br/><br/>\n");
      out.write("                </aside>\n");
      out.write("\n");
      out.write("                <aside class=\"span2\"></aside>\n");
      out.write("\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("\n");
      out.write("        <div class=\"container-fluid\">\n");
      out.write("            <div class=\"row-fluid\">\n");
      out.write("\n");
      out.write("                <aside class=\"span1\"></aside>\n");
      out.write("\n");
      out.write("                <aside class=\"span6\">\n");
      out.write("                    <h2> Informações </h2>\n");
      out.write("                    <br/>\n");
      out.write("                    <form name=\"Passo1\" action=\"Lv1-Passo2.jsp\" class=\"form-horizontal\" method =\"post\" onSubmit=\"return passo1();\">\n");
      out.write("                        <div class=\"control-group\">\n");
      out.write("                            <label class=\"control-label\">Área média da Pecuária Aproveitavel:</label>\n");
      out.write("                            <div class=\"controls\">\n");
      out.write("                                <br/>\n");
      out.write("                                <input type=\"text\" name=\"areapecuaria\">\n");
      out.write("                                <span class=\"help-inline\">Hectares</span>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"control-group\">\n");
      out.write("                            <div class=\"controls\">\n");
      out.write("                                <input type=\"submit\" class=\"btn\" value=\"Proximo Passo\" />\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                    </form>               \n");
      out.write("\n");
      out.write("                </aside>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("                <aside class=\"span3\">\n");
      out.write("                    <div class=\"panel panel-success\">\n");
      out.write("                        <div class=\"panel-heading\">\n");
      out.write("                            <h3 class=\"panel-title\">Panel title</h3>\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"panel-body\">\n");
      out.write("                            Panel content\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("\n");
      out.write("                </aside>\n");
      out.write("\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("\n");
      out.write("    </body>\n");
      out.write("\n");
      out.write("</html>");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
