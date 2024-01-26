package foodapp.security.jwt;

import org.slf4j.LoggerFactory;

import java.util.Date;

import org.slf4j.Logger;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Component;

import foodapp.security.userprinciple.userPrinciple;
import io.jsonwebtoken.ExpiredJwtException;
import io.jsonwebtoken.JwtException;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.MalformedJwtException;
import io.jsonwebtoken.SignatureAlgorithm;
import io.jsonwebtoken.UnsupportedJwtException;

@Component
public class JwtProvider {
	private static final Logger logger = LoggerFactory.getLogger(JwtProvider.class);
	private String jwtSecret = "secretkey";
	private int jwtExpiration = 86400;
	public String createToken(Authentication authentication) {
		userPrinciple userPrinciple = (userPrinciple) authentication.getPrincipal();
		return Jwts.builder()
				.setSubject(userPrinciple.getEmail())
				.setIssuedAt(new Date())
				.setExpiration(new Date(new Date().getTime() + jwtExpiration*1000))
				.signWith(SignatureAlgorithm.HS512,jwtSecret)
				.compact();		
	}
	public boolean validateToken(String authToken) {
        try {
            Jwts.parser().setSigningKey(jwtSecret).parseClaimsJws(authToken);
            return true;
        } catch (MalformedJwtException ex) {
            logger.error("Invalid JWT token");
        } catch (ExpiredJwtException ex) {
            logger.error("Expired JWT token");
        } catch (UnsupportedJwtException ex) {
            logger.error("Unsupported JWT token");
        } catch (IllegalArgumentException ex) {
            logger.error("JWT claims string is empty.");
        }
        return false;
    }
public String getUserNameFromToken(String token) {
	String username = Jwts.parser().setSigningKey(jwtSecret).parseClaimsJws(token).getBody().getSubject();
	return username;
}

}
