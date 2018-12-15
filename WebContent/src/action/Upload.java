package action;

import com.github.scribejava.core.model.Token;
import com.github.scribejava.core.model.Verifier;
import com.github.scribejava.core.oauth.OAuthService;
import model.Bean;
import org.apache.struts2.interceptor.SessionAware;
import rest.DropBoxRestClient;
import java.util.Map;

public class Upload extends DropBoxRestClient implements SessionAware{
    private static final long serialVersionUID = 4L;
    private Map<String, Object> session;

    public String execute() {
        try{
            OAuthService service = createService();
            Token accessToken = new Token("bMizrFH9wWAAAAAAAAAAP2hBepD34Q10cHLJ-AffWglMzTSGFWuG3ziT5HoWiU9D","");
            listFiles(service,accessToken);
            return "success";
        }catch(Exception e){
            System.out.println(e.getMessage());
        }
        return "rip";
    }
    public Bean getBean(){
        if(!session.containsKey("Bean"))
            this.setBean(new Bean());
        return (Bean) session.get("Bean");
    }

    public void setBean(Bean bean) {
        this.session.put("Bean", bean);
    }
    @Override
    public void setSession(Map<String, Object> session) {
        this.session = session;
    }

}
