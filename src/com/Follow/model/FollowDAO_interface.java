package com.Follow.model;

import java.util.List;

public interface FollowDAO_interface {
	public void insert(FollowVO followVO);
	public void delete(FollowVO followVO);
	public List<FollowVO> followList(String aMemId);
}
