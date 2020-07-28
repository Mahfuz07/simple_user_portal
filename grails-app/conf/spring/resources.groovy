import com.mahfuz.CustomUserDetailsService
import com.mahfuz.UserPasswordEncoderListener
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder

// Place your Spring DSL code here

beans = {
        userPasswordEncoderListener(UserPasswordEncoderListener)
        userDetailsService(CustomUserDetailsService)
        BCryptPasswordEncoder(BCryptPasswordEncoder)
}

