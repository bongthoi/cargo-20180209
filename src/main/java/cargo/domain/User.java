package cargo.domain;

import java.util.Date;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.data.domain.Persistable;
import org.springframework.format.annotation.DateTimeFormat;

@SuppressWarnings("serial")
public class User implements Persistable<String> {
	private transient boolean persisted;
	
			@NotEmpty
			@Email
			private String username;
			
			@NotEmpty
			@Size(min = 6, max = 20)
			private String password;
			
			@NotEmpty
			@Size(min = 6, max = 20)
			private String repassword;
			
			@NotEmpty
			private String FirstName;
			
			@NotEmpty
			private String LastName;
			
			@NotNull
			@DateTimeFormat(pattern="dd/MM/YY")
			private Date Birthday;
			
			@NotEmpty
			private String PhysicalWarehouseId;
			
			@NotEmpty
			private String UserGroupId;
			

			private Date RegisterDate;
			
	
			private Date UpdateDate;
			
	
			private String RegisterUser;
			

			private String UpdateUser;
			
			@NotEmpty
			private String LocationId;
	
			private String user_role;
			private int enabled;
			
			@Override
			public String getId() {
				// TODO Auto-generated method stub
				return username;
			}
			@Override
			public boolean isNew() {
				// TODO Auto-generated method stub
				return !persisted;
			}
			public void setPersisted(boolean persisted) {
				this.persisted = persisted;
			}
			
			public boolean isPersisted() {
				return persisted;
			}
			public boolean isMatchPassword(){
			        if (password == null) {
			            return repassword == null;
			        } else {
			            return password.equals(repassword);
			        }
			    }
			 
			public String getUsername() {
				return username;
			}
			public void setUsername(String username) {
				this.username = username;
			}
			public String getPassword() {
				return password;
			}
			public void setPassword(String password) {
				this.password = password;
			}
			public String getFirstName() {
				return FirstName;
			}
			public void setFirstName(String firstName) {
				FirstName = firstName;
			}
			public String getLastName() {
				return LastName;
			}
			public void setLastName(String lastName) {
				LastName = lastName;
			}
			public Date getBirthday() {
				return Birthday;
			}
			public void setBirthday(Date birthday) {
				Birthday = birthday;
			}
			public String getPhysicalWarehouseId() {
				return PhysicalWarehouseId;
			}
			public void setPhysicalWarehouseId(String physicalWarehouseId) {
				PhysicalWarehouseId = physicalWarehouseId;
			}
			public String getUserGroupId() {
				return UserGroupId;
			}
			public void setUserGroupId(String userGroupId) {
				UserGroupId = userGroupId;
			}
			public Date getRegisterDate() {
				return RegisterDate;
			}
			public void setRegisterDate(Date registerDate) {
				RegisterDate = registerDate;
			}
			public Date getUpdateDate() {
				return UpdateDate;
			}
			public void setUpdateDate(Date updateDate) {
				UpdateDate = updateDate;
			}
			public String getRegisterUser() {
				return RegisterUser;
			}
			public void setRegisterUser(String registerUser) {
				RegisterUser = registerUser;
			}
			public String getUpdateUser() {
				return UpdateUser;
			}
			public void setUpdateUser(String updateUser) {
				UpdateUser = updateUser;
			}
			public String getLocationId() {
				return LocationId;
			}
			public void setLocationId(String locationId) {
				LocationId = locationId;
			}
			public String getUser_role() {
				return user_role;
			}
			public void setUser_role(String user_role) {
				this.user_role = user_role;
			}
			public int getEnabled() {
				return enabled;
			}
			public void setEnabled(int enabled) {
				this.enabled = enabled;
			}
			
			public String getRepassword() {
				return repassword;
			}
			public void setRepassword(String repassword) {
				this.repassword = repassword;
			}
			public User(String username, String password, String firstName,
					String lastName, Date birthday, String physicalWarehouseId,
					String userGroupId, Date registerDate, Date updateDate,
					String registerUser, String updateUser, String locationId,
					String user_role, int enabled) {
				super();
				this.username = username;
				this.password = password;
				FirstName = firstName;
				LastName = lastName;
				Birthday = birthday;
				PhysicalWarehouseId = physicalWarehouseId;
				UserGroupId = userGroupId;
				RegisterDate = registerDate;
				UpdateDate = updateDate;
				RegisterUser = registerUser;
				UpdateUser = updateUser;
				LocationId = locationId;
				this.user_role = user_role;
				this.enabled = enabled;
			}
			public User() {
				// TODO Auto-generated constructor stub
			}
			@Override
			public String toString() {
				return "User [username=" + username + ", password=" + password
						+ ", repassword=" + repassword + ", FirstName="
						+ FirstName + ", LastName=" + LastName + ", Birthday="
						+ Birthday + ", PhysicalWarehouseId="
						+ PhysicalWarehouseId + ", UserGroupId=" + UserGroupId
						+ ", RegisterDate=" + RegisterDate + ", UpdateDate="
						+ UpdateDate + ", RegisterUser=" + RegisterUser
						+ ", UpdateUser=" + UpdateUser + ", LocationId="
						+ LocationId + ", user_role=" + user_role
						+ ", enabled=" + enabled + "]";
			}
			
			
}
