package web.repository;



import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.transaction.annotation.Transactional;

import web.model.Logo;



@Transactional
public interface LogoRepository extends JpaRepository<Logo, Integer> {

}
