package es.institutmarianao.domain.repository;

import es.institutmarianao.domain.User;

public interface UserRepository {
	User get(String username);
}
