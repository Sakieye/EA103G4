package com.category.model;

import java.util.List;
import java.util.Optional;

public class CategoryService {
	private final CategoryDAO categoryDAO;

	public CategoryService(CategoryDAO categoryDAO) {
		this.categoryDAO = categoryDAO;
	}

	public Optional<Category> addCategory(String categoryName) {
		categoryName = categoryName.replaceAll("\\s+", "");
		categoryName = categoryName.replace(".", ",");
		Optional<Category> parentCategory = getParentCategoryByChildCategoryName(categoryName);
		// 自動判斷故無需使用
		String parentCategoryID = null;
		StringBuffer categoryID = null;
		String categoryIDNum = null;
		int categoryLevel = 0;
		int temp;
		// 判斷本類別的層級並取得parentCategoryID
		if (parentCategory.isPresent()) {
			parentCategoryID = parentCategory.get().getCategoryID();
			if (Integer.parseInt(parentCategoryID.substring(5, 7)) > 0) {
				categoryLevel = 2;
			} else if (Integer.parseInt(parentCategoryID.substring(3, 5)) > 0) {
				categoryLevel = 1;
			}
		}

		// 計算本類別編碼值
		Optional<Category> currentMaxIDCategory = categoryDAO.findCurrentLevelMaxCategoryID(parentCategoryID,
				categoryLevel);
		// 同層級有其他類別存在
		if (currentMaxIDCategory.isPresent()) {
			String maxCategoryID = currentMaxIDCategory.get().getCategoryID();
			if (categoryLevel == 0) {
				temp = Integer.parseInt(maxCategoryID.substring(3, 5)) + 1;
				categoryIDNum = String.format("%02d", temp);
				categoryID = new StringBuffer(maxCategoryID).replace(3, 5, categoryIDNum);
			} else if (categoryLevel == 1) {
				temp = Integer.parseInt(maxCategoryID.substring(5, 7)) + 1;
				categoryIDNum = String.format("%02d", temp);
				categoryID = new StringBuffer(maxCategoryID).replace(5, 7, categoryIDNum);
			} else {
				temp = Integer.parseInt(maxCategoryID.substring(7)) + 1;
				categoryIDNum = String.format("%03d", temp);
				categoryID = new StringBuffer(maxCategoryID).replace(7, 10, categoryIDNum);
			}
			// 同層級無其他類別存在
		} else {
			if (categoryLevel == 0) {
				categoryID = new StringBuffer("CAT0100000");
			} else if (categoryLevel == 1) {
				categoryID = new StringBuffer(parentCategoryID).replace(5, 7, "01");
			} else {
				categoryID = new StringBuffer(parentCategoryID).replace(7, 10, "001");
			}
		}

		Category category = new Category(categoryID.toString(), categoryName, parentCategoryID);
		categoryDAO.insert(category);
		return Optional.of(category);
	}

	public Optional<Category> getByCategoryID(String categoryID) {
		return categoryDAO.findByCategoryID(categoryID);
	}

	public Optional<Category> getByCategoryName(String categoryName) {
		return categoryDAO.findByCategoryName(categoryName);
	}

	public Optional<Category> getParentCategoryByChildCategoryName(String categoryName) {
		categoryName = categoryName.replace(" ", "");
		int lastIdxOf = categoryName.lastIndexOf(',');
		if (lastIdxOf == -1) {
			return Optional.empty();
		}
		String parentCategoryName = categoryName.substring(0, lastIdxOf);
		return categoryDAO.findByCategoryName(parentCategoryName);
	}

	public List<Category> getByParentCategoryID(String parentCategoryID) {
		return categoryDAO.findByParentCategoryID(parentCategoryID);
	}

	public List<Category> getAll() {
		return categoryDAO.getAll();
	}

	public Optional<Category> getCurrentLevelMaxCategoryID(String parentCategoryID, int categoryLevel) {
		return categoryDAO.findCurrentLevelMaxCategoryID(parentCategoryID, categoryLevel);
	}

	public Optional<Category> updateCategory(String categoryID, String categoryName, String parentCategoryID) {
		Category category = new Category(categoryID, categoryName, parentCategoryID);
		categoryDAO.update(category);
		return Optional.of(category);
	}

	public void deleteCategory(String categoryID) {
		categoryDAO.delete(categoryID);
	}
}
